part of 'post_list_bloc.dart';


@immutable
sealed class PostListEvent {}

class GetAllPosts extends PostListEvent {}
