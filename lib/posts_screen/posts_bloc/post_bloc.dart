import 'package:bloc/bloc.dart';
import 'package:cc_flutter/shared/models/post.dart';
import 'package:flutter/material.dart';

import '../../shared/exceptions/app_exception.dart';
import '../../shared/repositories/post_repository.dart';


part 'post_event.dart';
part 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(const PostState()) {
    on<GetAllPosts>((event, emit) async {
      Post post = await postRepository.getAllPosts();
      emit(state.copyWith(post: post));
    });
  }
}
