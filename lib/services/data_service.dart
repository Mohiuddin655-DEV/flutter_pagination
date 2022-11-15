import 'dart:convert';

import 'package:flutter_pagination/model/album.dart';
import 'package:flutter_pagination/model/comment.dart';
import 'package:flutter_pagination/model/photo.dart';
import 'package:flutter_pagination/model/post.dart';
import 'package:http/http.dart';

class DataService {
  // https://jsonplaceholder.typicode.com/posts?_page=3
  // https://jsonplaceholder.typicode.com/posts?_limit=15&_page=3

  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<List<Album>> getAlbums() async {
    try {
      final uri = Uri.parse("${_baseUrl}albums");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Album.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load albums");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Album>> getAlbumsByPage(int page) async {
    try {
      final uri = Uri.parse("${_baseUrl}albums?_page=$page");

      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Album.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load albums");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Album>> getAlbumsByPageWithLimitation(int page, int limit) async {
    try {
      final uri = Uri.parse("${_baseUrl}albums?_limit=$limit&_page=$page");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Album.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load albums");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Comment>> getComments() async {
    try {
      final uri = Uri.parse("${_baseUrl}comments");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Comment.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load comments");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Comment>> getCommentsByPage(int page) async {
    try {
      final uri = Uri.parse("${_baseUrl}comments?_page=$page");

      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Comment.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load comments");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Comment>> getCommentsByPageWithLimitation(
      int page, int limit) async {
    try {
      final uri = Uri.parse("${_baseUrl}comments?_limit=$limit&_page=$page");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Comment.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load comments");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Photo>> getPhotos() async {
    try {
      final uri = Uri.parse("${_baseUrl}photos");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Photo.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load photos");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Photo>> getPhotosByPage(int page) async {
    try {
      final uri = Uri.parse("${_baseUrl}photos?_page=$page");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Photo.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load photos");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Photo>> getPhotosByPageWithLimitation(int page, int limit) async {
    try {
      final uri = Uri.parse("${_baseUrl}photos?_limit=$limit&_page=$page");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Photo.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load photos");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Post>> getPosts() async {
    try {
      final uri = Uri.parse("${_baseUrl}posts");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Post.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Post>> getPostsByPage(int page) async {
    try {
      final uri = Uri.parse("${_baseUrl}posts?_page=$page");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Post.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Post>> getPostsByPageWithLimitation(int page, int limit) async {
    try {
      final uri = Uri.parse("${_baseUrl}posts?_limit=$limit&_page=$page");
      final response = await get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) => Post.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      rethrow;
    }
  }
}
