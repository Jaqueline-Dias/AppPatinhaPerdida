import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'about_page.dart';

class AboutModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/about';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/app': (context) => const AboutPage(),
      };
}
