import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'login_page.dart';
import 'login_view_model.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => LoginViewModel()),
      ];

  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
