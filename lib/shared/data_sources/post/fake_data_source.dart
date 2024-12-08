import 'package:cc_flutter/shared/models/post.dart';

import 'data_source_interface.dart';

class FakeDataSource implements PostDataSource {
  @override
  Future<Post> getAllPosts() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return Post(
          title: "Fake Post",
          description: "Loremp ipsum fake description",
      );
    });
  }

}