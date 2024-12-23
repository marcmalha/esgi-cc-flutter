import '../data_sources/post/data_source_interface.dart';
import '../models/post.dart';

class PostRepository {
  final PostDataSource dataSource;

  PostRepository({required this.dataSource});

  Future<List<Post>> getAllPosts() async {
    return dataSource.getAllPosts();
  }

  Future<Post?> createPost(Post newPost) async {
    return dataSource.createPost(newPost);
  }

  Future<Post?> updatePost(Post post, {String? newTitle, String? newDescription}) async {
    return dataSource.updatePost(post, newTitle: newTitle, newDescription: newDescription);
  }
}