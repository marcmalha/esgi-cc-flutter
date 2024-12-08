part of 'post_bloc.dart';

class PostState {
  final Post? post;
  final AppException? exception;

  const PostState({
    this.post,
    this.exception,
  });

  PostState copyWith({Post? post, AppException? exception}) {
    return PostState(post: post, exception: exception);
  }

}