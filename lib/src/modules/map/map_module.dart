import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:patinha_app/src/modules/map/map_page.dart';

class MapModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/map';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const MapPage(),
      };
}
