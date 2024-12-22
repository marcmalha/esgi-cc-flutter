part of 'post_creation_bloc.dart';

enum Status {
  input,
  loading,
  success,
  failure,
}

class PostCreationState {
  final Status status;
  final Post? post;
  final AppException? exception;

  const PostCreationState({
    this.status = Status.loading,
    this.post,
    this.exception,
  });

  PostCreationState copyWith({required Status status, Post? post, AppException? exception}) {
    return PostCreationState(
        status: status,
        post: post,
        exception: exception
    );
  }
}
