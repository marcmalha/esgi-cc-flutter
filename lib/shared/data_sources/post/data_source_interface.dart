import 'package:cc_flutter/shared/models/post.dart';

abstract class PostDataSource {
    Future<Post> getAllPosts();
}