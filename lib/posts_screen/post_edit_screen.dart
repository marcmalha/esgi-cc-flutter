import 'package:cc_flutter/posts_screen/post_creation_bloc/post_bloc.dart';
import 'package:cc_flutter/posts_screen/post_list_bloc/post_list_bloc.dart' hide Status;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/models/post.dart';

class PostEditScreen extends StatefulWidget {
  final Post post;

  static Future<void> navigateTo(BuildContext context, Post post) {
    return Navigator.pushNamed(context, 'postEdit', arguments: post);
  }

  const PostEditScreen({super.key, required this.post});

  @override
  State<PostEditScreen> createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late Post _post;

  @override
  void initState() {
    super.initState();
    _post = widget.post;
    titleController.text = _post.title;
    descriptionController.text = _post.description;

    context.read<PostBloc>()
        .add(PostEditing());
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Edit Post')
          ),
          actions: [
            IconButton(onPressed: () {

            },
                icon: const Icon(Icons.edit))
          ],
        ),
        body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          return Container(
            child: switch (state.status) {
              Status.editing => _showEditing(context),
              Status.loading => _showLoading(context),
              Status.success => _showSuccess(context),
              Status.failure => _showFailure(context),
              Status.creating => _showFailure(context),
            },
          );
        })
    );
  }


  Widget _showEditing(BuildContext context) {
    return
      Form(
          child: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50, width: 20),
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      hintText: 'Write the title of your post here',
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20, width: 20),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Write the description of your post here',
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Description cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20, width: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          final newPost = Post(
                            title: titleController.text,
                            description: descriptionController.text,
                          );

                          context.read<PostBloc>()
                              .add(PostEdited(_post, newPost));
                        }
                      },
                      child: const Text('Save'),
                    ),
                  )
                ],
              ),
            );
          })
      );
  }

  Widget _showSuccess(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Your post was successfully edited!", style: TextStyle(fontSize: 20),),
          ElevatedButton(
            onPressed: _navigateBack,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Adjust this value to make it less round
                )
            ),
            child: const Text("Go Back"),
          )
        ],
      ),
    );
  }

  Widget _showLoading(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator()
    );
  }

  Widget _showFailure(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Error editing post", style: TextStyle(fontSize: 20),),
          ElevatedButton(
            onPressed: _navigateBack,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Adjust this value to make it less round
                )
            ),
            child: const Text("Go Back"),
          )
        ],
      ),
    );
  }

  void _navigateBack() {
    context.read<PostListBloc>()
        .add(GetAllPosts());

    Navigator.pop(context);
    Navigator.popAndPushNamed(context, 'postDetail', arguments: _post);
  }
}
