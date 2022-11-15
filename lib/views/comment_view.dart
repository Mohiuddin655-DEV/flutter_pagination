import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/controllers/widget_controller.dart';
import 'package:flutter_pagination/items/item_comment.dart';
import 'package:flutter_pagination/model/comment.dart';
import 'package:flutter_pagination/states/cubit_state.dart';
import 'package:flutter_pagination/widgets/loading_indicator.dart';

import '../cubits/comment_cubit.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mCubit = context.read<CommentCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: BlocBuilder<CommentCubit, CubitState>(
        builder: (context, state) {
          return CommentsBody(
            state: state,
            reachAtBottom: mCubit.loadNext,
          );
        },
      ),
    );
  }
}

class CommentsBody extends StatefulWidget {
  final CubitState state;
  final Function() reachAtBottom;

  const CommentsBody({
    Key? key,
    required this.reachAtBottom,
    required this.state,
  }) : super(key: key);

  @override
  State<CommentsBody> createState() => _CommentsBodyState();
}

class _CommentsBodyState extends State<CommentsBody> {
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
          Comment item = data[index];
          return ItemComment(item);
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
