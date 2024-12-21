import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/models/post.dart';
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
      appBar: AppBar(
        title: const Center(
            child: Text('Posts')
        ),
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        return Expanded(
          child: switch (state.status) {
            Status.loading => _buildLoading(),
            Status.empty => _buildEmpty(),
            Status.success => _buildSuccess(state),
            Status.failure => _buildError(),
          },
        );
      }),
    );
  }

  Widget _buildLoading() {
    return const Center(
        child: CircularProgressIndicator()
    );
  }

  Widget _buildEmpty() {
    return const Center(
      child: Text('No Posts currently available'),
    );
  }

  Widget _buildSuccess(PostState state) {
    return RefreshIndicator(
      onRefresh: () async {
        _getAllPosts();
      },
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          Post currentPost = state.posts[index];

          return PostListItem(
            title: currentPost.title,
            description: currentPost.description,
          );
        },
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Error fetching posts", style: TextStyle(fontSize: 20),),
          ElevatedButton(
            onPressed: _getAllPosts,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Adjust this value to make it less round
                )
            ),
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }

  void _getAllPosts() {
    final postsBloc = context.read<PostBloc>();

    postsBloc.add(GetAllPosts());
  }
}