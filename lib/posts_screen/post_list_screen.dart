import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'posts_bloc/post_bloc.dart';
import 'widgets/post_list_item.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    _getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        return Center(
          child: PostListItem(
            title: state.post?.title,
            description: state.post?.description,
          ),
        );
      }),
    );
  }

  void _getAllPosts() {
    final postsBloc = context.read<PostBloc>();

    postsBloc.add(GetAllPosts());
  }
}