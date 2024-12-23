import 'dart:ui';

import 'package:cc_flutter/posts_screen/post_edit_screen.dart';
import 'package:flutter/material.dart';

import '../shared/models/post.dart';

class PostDetailScreen extends StatelessWidget {
  static Future<void> navigateTo(BuildContext context, Post post) {
    return Navigator.pushNamed(context, 'postDetail', arguments: post);
  }

  final Post post;

  const PostDetailScreen({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(post.title)
        ),
        actions: [
          IconButton(onPressed: () {
            PostEditScreen.navigateTo(context, post);
          },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Text(post.description),
      ),
    );
  }
}
