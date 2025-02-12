import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'first_page_report_page.dart';
import 'first_page_report_view_model.dart';

class FirstPageReportRouter extends FlutterGetItModulePageRouter {
  const FirstPageReportRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => FirstPageReportViewModel()),
      ];

  @override
  WidgetBuilder get view => (_) => FirstPageReportPage();
}
