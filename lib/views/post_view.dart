import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/controllers/widget_controller.dart';
import 'package:flutter_pagination/cubits/post_cubit.dart';
import 'package:flutter_pagination/items/item_post.dart';
import 'package:flutter_pagination/model/post.dart';
import 'package:flutter_pagination/states/cubit_state.dart';
import 'package:flutter_pagination/widgets/loading_indicator.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mCubit = context.read<PostCubit>();

    return BlocBuilder<PostCubit, CubitState>(
      builder: (context, state) {
        return PostsBody(
          state: state,
          reachAtBottom: mCubit.loadNext,
        );
      },
    );
  }
}

class PostsBody extends StatefulWidget {
  final CubitState state;
  final Function() reachAtBottom;

  const PostsBody({
    Key? key,
    required this.reachAtBottom,
    required this.state,
  }) : super(key: key);

  @override
  State<PostsBody> createState() => _PostsBodyState();
}

class _PostsBodyState extends State<PostsBody> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = Controller(context).paging(func: widget.reachAtBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final data = state.result;
    if (state.isLoading && data.isEmpty) {
      return const LoadingIndicator();
    }
    return ListView.separated(
      controller: _controller,
      itemBuilder: (context, index) {
        if (index < data.length) {
          Post item = data[index];
          return ItemPost(item);
        } else {
          return const LoadingIndicator();
        }
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey.withOpacity(0.25),
        );
      },
      itemCount: data.length + (state.isLoading ? 1 : 0),
    );
  }
}
