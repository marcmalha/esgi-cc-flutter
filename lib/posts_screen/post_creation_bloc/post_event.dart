part of 'post_bloc.dart';

sealed class PostEvent {}

class PostInput extends PostEvent {}

class PostCreated extends PostEvent {
  final Post post;

  PostCreated(this.post);
}
