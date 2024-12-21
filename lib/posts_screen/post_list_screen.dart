import 'package:cc_flutter/posts_screen/post_creation_screen.dart';
import 'package:cc_flutter/posts_screen/post_detail_screen.dart';
import 'package:cc_flutter/posts_screen/post_list_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/models/post.dart';
import 'widgets/post_list_item.dart';

class PostListScreen extends StatefulWidget {
  static Future<void> navigateTo(BuildContext context) {
    return Navigator.pushNamed(context, '/');
  }

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
      body: BlocBuilder<PostBloc, PostListState>(builder: (context, state) {
        return Container(
          child: switch (state.status) {
            Status.loading => _buildLoading(),
            Status.empty => _buildEmpty(),
            Status.success => _buildSuccess(state),
            Status.failure => _buildError(),
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _onNewPostButtonPressed(context),
        icon: const Icon(Icons.add),
        label: const Text('New Post'),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
        child: CircularProgressIndicator()
    );
  }

  Widget _buildEmpty() {
    return RefreshIndicator(
      onRefresh: () async {
        _getAllPosts();
      },
      child: const Center(
          child: Text('No Posts currently available'),
        )
      );
  }

  Widget _buildSuccess(PostListState state) {
    return RefreshIndicator(
      onRefresh: () async {
        _getAllPosts();
      },
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          Post currentPost = state.posts[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PostListItem(
              post: currentPost,
              onTap: () => _onPostTap(context, currentPost),
            ),
          );
        },
      ),
    );
  }

  void _onPostTap(BuildContext context, Post post) {
    PostDetailScreen.navigateTo(context, post);
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

  void _onNewPostButtonPressed(BuildContext context) {
    PostCreationScreen.navigateTo(context);
  }
}