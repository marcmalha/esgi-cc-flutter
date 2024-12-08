import '../data_sources/post/data_source_interface.dart';
import '../models/post.dart';

class PostRepository {
  final PostDataSource dataSource;

  PostRepository({required this.dataSource});

  Future<Post> getAllPosts() async {
    return dataSource.getAllPosts();
  }
}