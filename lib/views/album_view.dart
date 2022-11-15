import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/controllers/widget_controller.dart';
import 'package:flutter_pagination/cubits/cubit_album.dart';
import 'package:flutter_pagination/items/item_album.dart';
import 'package:flutter_pagination/model/album.dart';
import 'package:flutter_pagination/states/cubit_state.dart';
import 'package:flutter_pagination/widgets/loading_indicator.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mCubit = context.read<AlbumCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Albums"),
      ),
      body: BlocBuilder<AlbumCubit, CubitState>(
        builder: (context, state) {
          return AlbumsBody(
            state: state,
            reachAtBottom: mCubit.loadNext,
          );
        },
      ),
    );
  }
}

class AlbumsBody extends StatefulWidget {
  final CubitState state;
  final Function() reachAtBottom;

  const AlbumsBody({
    Key? key,
    required this.reachAtBottom,
    required this.state,
  }) : super(key: key);

  @override
  State<AlbumsBody> createState() => _AlbumsBodyState();
}

class _AlbumsBodyState extends State<AlbumsBody> {
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
          Album item = data[index];
          return ItemAlbum(item);
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
