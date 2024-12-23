part of 'post_list_bloc.dart';

enum Status {
  loading,
  empty,
  success,
  failure,
}

class PostListState {
  final Status status;
  final List<Post> posts;
  final AppException? exception;

  const PostListState({
    this.status = Status.loading,
    this.posts = const [],
    this.exception,
  });

  PostListState copyWith({required Status status, List<Post> posts = const [], AppException? exception}) {
    return PostListState(
        status: status,
        posts: posts,
        exception: exception
    );
  }
}
