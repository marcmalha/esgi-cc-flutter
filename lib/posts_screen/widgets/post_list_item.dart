import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title ?? "Empty title", style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 20),
        Text(description ?? "Empty description"),
      ],
    );
  }

}