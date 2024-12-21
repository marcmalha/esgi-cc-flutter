import 'package:cc_flutter/shared/models/post.dart';

import 'data_source_interface.dart';

class FakeDataSource implements PostDataSource {
  @override
  Future<List<Post>> getAllPosts() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return List.of([
        Post(
          title: "Fake Post",
          description: "Loremp ipsum fake description",
        ),
        Post(
          title: "Fake News",
          description: "Kamala Harris is president",
        ),
        Post(
          title: "Fake News",
          description: "Kamala Harris is president",
        ),
        Post(
          title: "Fake Post",
          description: "Loremp ipsum fake description",
        ),
      ]);
    });
  }

}