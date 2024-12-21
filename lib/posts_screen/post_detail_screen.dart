import 'dart:ui';

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
      ),
      body: Center(
        child: Text(post.description),
      ),
    );
  }
}
