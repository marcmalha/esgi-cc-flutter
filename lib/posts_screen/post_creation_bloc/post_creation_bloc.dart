import 'package:bloc/bloc.dart';
import 'package:cc_flutter/shared/models/post.dart';
import 'package:flutter/rendering.dart';

import '../../shared/exceptions/app_exception.dart';
import '../../shared/repositories/post_repository.dart';

part 'post_creation_event.dart';
part 'post_creation_state.dart';


class PostCreationBloc extends Bloc<PostCreationEvent, PostCreationState> {
  final PostRepository postRepository;

  PostCreationBloc({required this.postRepository}) : super(const PostCreationState()) {
    on<PostInput>((event, emit) {
      emit(state.copyWith(status: Status.input));
    });

    on<PostCreated>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      final newPost = event.post;
      final response = await postRepository.createPost(newPost);

      if (response == null) {
        emit(state.copyWith(status: Status.failure));
      } else {
        emit(state.copyWith(status: Status.success, post: newPost));
      }
    });
  }
}
