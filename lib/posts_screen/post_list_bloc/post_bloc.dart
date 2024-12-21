import 'package:bloc/bloc.dart';
import 'package:cc_flutter/shared/models/post.dart';
import 'package:flutter/material.dart';

import '../../shared/exceptions/app_exception.dart';
import '../../shared/repositories/post_repository.dart';


part 'post_event.dart';
part 'post_list_state.dart';


class PostBloc extends Bloc<PostEvent, PostListState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(const PostListState()) {
    on<GetAllPosts>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        List<Post> posts = await postRepository.getAllPosts();

        if (posts.isEmpty) {
          emit(state.copyWith(status: Status.empty));
        } else {
          emit(state.copyWith(status: Status.success, posts: posts));
        }
      } catch (exception) {
        emit(state.copyWith(status: Status.failure, exception: NetworkException()));
        debugPrint(exception.toString());
      }
    });

  on<PostCreated>((event, emit) async {
    final newPost = event.post;

  });
  }
}
