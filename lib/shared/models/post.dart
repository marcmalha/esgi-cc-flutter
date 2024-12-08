import 'package:flutter/material.dart';

class Post {
  final UniqueKey id = UniqueKey();
  String title;
  String description;

  Post({
    required this.title,
    required this.description,
  });
}