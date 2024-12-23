part of 'post_bloc.dart';

sealed class PostEvent {}

class PostCreating extends PostEvent {}

class PostCreated extends PostEvent {
  final Post post;

  PostCreated(this.post);
}

class PostEditing extends PostEvent {}

class PostEdited extends PostEvent {
  final Post oldPost;
  final Post newPost;

  PostEdited(this.oldPost, this.newPost);
}
