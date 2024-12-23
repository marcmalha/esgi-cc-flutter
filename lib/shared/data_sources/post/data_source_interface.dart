import 'package:cc_flutter/shared/models/post.dart';

abstract class PostDataSource {

    Future<List<Post>> getAllPosts();

    Future<Post?> createPost(Post newPost);

    Future<Post> getPost(int postIndex);

    Future<Post> updatePost(Post post, {String? newTitle, String? newDescription});
}