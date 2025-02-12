import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'developers_page.dart';

class DevelopersModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/info';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/developers': (context) => const DevelopersPage(),
      };
}
