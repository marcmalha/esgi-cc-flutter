import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../shared/models/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    super.key,
    required this.post,
    required this.onTap,
  });

  final Post post;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onTap,
            child: SizedBox(
              width: 400,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(post.description),
                  ),
                ],
              ),
            ),
        ),
    );
  }

}