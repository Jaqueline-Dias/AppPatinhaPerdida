import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'login/login_router.dart';

class AuthModule extends FlutterGetItModule {
  /*@override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserLoginService>(
            (i) => UserLoginServiceImpl())
      ];*/

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/login': (_) => const LoginRouter(),
      };
}
