import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'post/post_page.dart';

class FeedModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/feed';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/post': (context) => const PostPage(),
      };
}
