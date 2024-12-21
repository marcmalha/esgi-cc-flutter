part of 'post_bloc.dart';


@immutable
sealed class PostEvent {}

class GetAllPosts extends PostEvent {}

class PostCreated extends PostEvent {
  final Post post;

  PostCreated(this.post);
}
