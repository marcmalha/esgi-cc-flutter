part of 'post_creation_bloc.dart';

sealed class PostCreationEvent {}

class PostCreated extends PostCreationEvent {
  final Post post;

  PostCreated(this.post);
}