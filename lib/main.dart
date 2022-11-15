import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/cubits/comment_cubit.dart';
import 'package:flutter_pagination/cubits/cubit_album.dart';
import 'package:flutter_pagination/cubits/photo_cubit.dart';
import 'package:flutter_pagination/cubits/post_cubit.dart';
import 'package:flutter_pagination/states/cubit_state.dart';
import 'package:flutter_pagination/views/post_view.dart';

import 'views/album_view.dart';
import 'views/comment_view.dart';
import 'views/photo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AlbumCubit()..loadFirst()),
          BlocProvider(create: (context) => CommentCubit()..loadFirst()),
          BlocProvider(create: (context) => PhotoCubit()..loadFirst()),
          BlocProvider(create: (context) => PostCubit()..loadFirst()),
        ],
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              automaticIndicatorColorAdjustment: true,
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  overflow: TextOverflow.ellipsis),
              labelPadding: EdgeInsets.symmetric(vertical: 8),
              tabs: [
                Text("Albums", style: TextStyle(fontSize: 16)),
                Text("Comments", style: TextStyle(fontSize: 16)),
                Text("Photos", style: TextStyle(fontSize: 16)),
                Text("Posts", style: TextStyle(fontSize: 16)),
              ],
            ),
            title: Text(
              "Home".toUpperCase(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
          ),
          body: const TabBarView(
            children: [
              AlbumsScreen(),
              CommentsScreen(),
              PhotosScreen(),
              PostsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class Albums extends StatelessWidget {
  const Albums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mCubit = context.read<AlbumCubit>();
    return BlocBuilder<AlbumCubit, CubitState>(
      builder: (context, state) {
        return AlbumsBody(
          state: state,
          reachAtBottom: mCubit.loadNext,
        );
      },
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mCubit = context.read<CommentCubit>();
    return BlocBuilder<CommentCubit, CubitState>(
      builder: (context, state) {
        return CommentsBody(
          state: state,
          reachAtBottom: mCubit.loadNext,
        );
      },
    );
  }
}

class Photos extends StatelessWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mCubit = context.read<PhotoCubit>();
    return BlocBuilder<PhotoCubit, CubitState>(
      builder: (context, state) {
        return PhotosBody(
          state: state,
          reachAtBottom: mCubit.loadNext,
        );
      },
    );
  }
}

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

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
