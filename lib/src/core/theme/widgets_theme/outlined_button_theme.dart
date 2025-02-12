import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/constants.dart';

class PPOutlinedButtonTheme {
  PPOutlinedButtonTheme._();

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: PPColors.dark,
      side: const BorderSide(color: PPColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: PPColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: PPSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PPSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: PPColors.light,
      side: const BorderSide(color: PPColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: PPColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: PPSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PPSizes.buttonRadius)),
    ),
  );
}
