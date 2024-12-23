import 'package:bloc/bloc.dart';
import 'package:cc_flutter/shared/models/post.dart';

import '../../shared/exceptions/app_exception.dart';
import '../../shared/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(const PostState()) {
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
