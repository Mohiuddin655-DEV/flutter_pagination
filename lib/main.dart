import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/controllers/widget_controller.dart';
import 'package:flutter_pagination/cubits/comment_cubit.dart';
import 'package:flutter_pagination/cubits/cubit_album.dart';
import 'package:flutter_pagination/cubits/photo_cubit.dart';
import 'package:flutter_pagination/cubits/post_cubit.dart';
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
    final controller = Controller(context);
    final items = ["Albums", "Comments", "Photos", "Posts"];
    return Scaffold(
      appBar: AppBar(
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
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final item = items[index];
            return MaterialButton(
              onPressed: () {
                switch (item) {
                  case "Albums":
                    controller.loadScreen(
                      BlocProvider(
                        create: (context) => AlbumCubit()..loadFirst(),
                        child: const AlbumsScreen(),
                      ),
                    );
                    break;
                  case "Comments":
                    controller.loadScreen(
                      BlocProvider(
                        create: (context) => CommentCubit()..loadFirst(),
                        child: const CommentsScreen(),
                      ),
                    );
                    break;
                  case "Photos":
                    controller.loadScreen(
                      BlocProvider(
                        create: (context) => PhotoCubit()..loadFirst(),
                        child: const PhotosScreen(),
                      ),
                    );
                    break;
                  case "Posts":
                    controller.loadScreen(
                      BlocProvider(
                        create: (context) => PostCubit()..loadFirst(),
                        child: const PostsScreen(),
                      ),
                    );
                    break;
                  default:
                    controller.loadScreen(
                      BlocProvider(
                        create: (context) => PostCubit()..loadFirst(),
                        child: const PostsScreen(),
                      ),
                    );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    items[index],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return Container(
              color: Colors.black.withOpacity(0.05),
              height: 1,
            );
          },
        ),
      ),
    );
  }
}
