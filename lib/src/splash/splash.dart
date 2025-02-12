import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/theme/patinha_perdida_theme.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacementNamed('/auth/login');
        // Navigator.of(context).pushReplacementNamed('/auth/login');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PatinhaPerdidaTheme.violetDark,
      body: Center(
        child: SvgPicture.asset(
          'assets/images/logo-claro.svg',
        ),
      ),
    );
  }
}
