import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'second_page_report_page.dart';

class SecondPageReportRouter extends FlutterGetItModulePageRouter {
  const SecondPageReportRouter({super.key});
/*
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => SecondPageReportViewModel()),
      ];
*/
  @override
  WidgetBuilder get view => (_) => const SecondPageReportPage();
}
