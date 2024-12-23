import 'dart:ffi';

import 'package:cc_flutter/shared/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'data_source_interface.dart';

class FakeDataSource implements PostDataSource {
  static List<Post> currentPosts = List.of([
    Post(
      title: "Fake Post",
      description: "Loremp ipsum fake description",
    ),
    Post(
      title: "Fake News",
      description: "Kamala Harris is president",
    ),
    Post(
      title: "Fake News",
      description: "Kamala Harris is president",
    ),
    Post(
      title: "Fake Post",
      description: "Loremp ipsum fake description",
    ),
  ]);

  @override
  Future<List<Post>> getAllPosts() async {
    return Future.delayed(const Duration(seconds: 1), () {
      debugPrint("on getAllPosts posts length = ${currentPosts.length}");
      return currentPosts;
    });
  }

  @override
  Future<Post> getPost(int postIndex) async {
    return Future.delayed(const Duration(seconds: 1), () {
      return currentPosts.elementAt(postIndex);
    });
  }

  @override
  Future<Post?> createPost(Post newPost) async {
    return Future.delayed(const Duration(milliseconds: 250), () {
      currentPosts.add(newPost);

      return newPost;
    });
  }

  @override
  Future<Post> updatePost(Post post, {String? newTitle, String? newDescription}) async {
    return Future.delayed(const Duration(milliseconds: 250), () {
      final currentIndex = currentPosts.indexWhere((Post curr) => curr.id == post.id);

      return currentPosts[currentIndex].update(
        newTitle,
        newDescription,
      );
    });
  }

}