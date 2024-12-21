import 'package:cc_flutter/shared/models/post.dart';

abstract class PostDataSource {
    Future<List<Post>> getAllPosts();
}