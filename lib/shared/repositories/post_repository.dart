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

  Future<Post> updatePost(int postIndex, {String? newTitle, String? newDescription}) async {
    return dataSource.updatePost(postIndex, newTitle: newTitle, newDescription: newDescription);
  }
}