part of 'post_bloc.dart';

enum Status {
  input,
  loading,
  success,
  failure,
}

class PostState {
  final Status status;
  final Post? post;
  final AppException? exception;

  const PostState({
    this.status = Status.loading,
    this.post,
    this.exception,
  });

  PostState copyWith({required Status status, Post? post, AppException? exception}) {
    return PostState(
        status: status,
        post: post,
        exception: exception
    );
  }
}
