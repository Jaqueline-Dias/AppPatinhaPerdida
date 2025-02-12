import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/constants.dart';

class PPAppBarTheme {
  PPAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: PPColors.black, size: PPSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: PPColors.black, size: PPSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: PPColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: PPColors.black, size: PPSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: PPColors.white, size: PPSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: PPColors.white),
  );
}
