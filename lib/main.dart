import 'package:cc_flutter/posts_screen/post_creation_bloc/post_bloc.dart';
import 'package:cc_flutter/posts_screen/post_creation_screen.dart';
import 'package:cc_flutter/posts_screen/post_detail_screen.dart';
import 'package:cc_flutter/posts_screen/post_list_bloc/post_list_bloc.dart';
import 'package:cc_flutter/posts_screen/post_list_screen.dart';
import 'package:cc_flutter/shared/data_sources/post/fake_data_source.dart';
import 'package:cc_flutter/shared/models/post.dart';
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
    final postsRepository = PostRepository(dataSource: FakeDataSource());

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => PostListBloc(postRepository: postsRepository),),
          BlocProvider(create: (BuildContext context) => PostBloc(postRepository: postsRepository), ),
        ],
        child: MaterialApp(
          title: 'Flutter CC',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
        ),
        routes: {
          '/': (context) => const PostListScreen(),
          '/create': (context) => const PostCreationScreen(),
        },
        onGenerateRoute: (routeSettings) {
          Widget screen = Container(color: Colors.pink);
          final argument = routeSettings.arguments;
          switch (routeSettings.name) {
            case 'postDetail':
              if (argument is Post) {
                screen = PostDetailScreen(post: argument);
              }
              break;
          }

          return MaterialPageRoute(builder: (context) => screen);
        },
      ),
    );
  }
}
