import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/constants.dart';

/* -- Light & Dark Elevated Button Themes -- */
class PPElevatedButtonTheme {
  PPElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: PPColors.light,
      backgroundColor: PPColors.primary,
      disabledForegroundColor: PPColors.darkGrey,
      disabledBackgroundColor: PPColors.buttonDisabled,
      side: const BorderSide(color: PPColors.primary),
      padding: const EdgeInsets.symmetric(vertical: PPSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: PPColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PPSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: PPColors.light,
      backgroundColor: PPColors.primary,
      disabledForegroundColor: PPColors.darkGrey,
      disabledBackgroundColor: PPColors.darkerGrey,
      side: const BorderSide(color: PPColors.primary),
      padding: const EdgeInsets.symmetric(vertical: PPSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: PPColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PPSizes.buttonRadius)),
    ),
  );
}
