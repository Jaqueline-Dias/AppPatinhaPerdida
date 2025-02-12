import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:patinha_app/src/core/constants/constants.dart';
import 'package:patinha_app/src/modules/map/map_module.dart';

import 'core/patinha_perdida_config.dart';
import 'modules/about/about_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/developers/developers_module.dart';
import 'modules/feed/feed_module.dart';
import 'modules/help/help_module.dart';
import 'modules/home/home_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/report/report_module.dart';
import 'splash/splash.dart';

class PatinhaPerdidaApp extends StatelessWidget {
  const PatinhaPerdidaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PatinhaPerdidaConfig(
      title: PPTexts.appName,
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const Splash(),
          path: '/',
        ),
      ],
      modules: [
        HomeModule(),
        AuthModule(),
        FeedModule(),
        HelpModule(),
        ReportModule(),
        AboutModule(),
        DevelopersModule(),
        ProfileModule(),
        MapModule(),
      ],
    );
  }
}
