import 'package:cc_flutter/posts_screen/post_list_screen.dart';
import 'package:cc_flutter/posts_screen/posts_bloc/post_bloc.dart';
import 'package:cc_flutter/shared/data_sources/post/fake_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/repositories/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => PostBloc(postRepository: PostRepository(dataSource: FakeDataSource())),
        child: MaterialApp(
          title: 'Flutter CC',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
        ),
        home: const PostListScreen(),
      ),
    );
  }
}
