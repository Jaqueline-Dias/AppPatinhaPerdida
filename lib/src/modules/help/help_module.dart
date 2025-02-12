import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'help_page.dart';

class HelpModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/help';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/description': (context) => const HelpPage(),
      };
}
