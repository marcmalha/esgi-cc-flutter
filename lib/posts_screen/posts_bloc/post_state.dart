part of 'post_bloc.dart';

enum Status {
  loading,
  empty,
  success,
  failure,
}

class PostState {
  final Status status;
  final List<Post> posts;
  final AppException? exception;

  const PostState({
    this.status = Status.loading,
    this.posts = const [],
    this.exception,
  });

  PostState copyWith({required Status status, List<Post> posts = const [], AppException? exception}) {
    return PostState(
        status: status,
        posts: posts,
        exception: exception
    );
  }

}