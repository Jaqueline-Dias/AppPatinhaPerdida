import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'post_page.dart';
import 'post_view_module.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => PostViewModule()),
      ];

  @override
  WidgetBuilder get view => (_) => const PostPage();
}
