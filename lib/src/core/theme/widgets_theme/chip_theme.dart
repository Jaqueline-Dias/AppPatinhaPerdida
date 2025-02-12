import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/constants.dart';

class PPChipTheme {
  PPChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: PPColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: PPColors.black),
    selectedColor: PPColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: PPColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: PPColors.darkerGrey,
    labelStyle: TextStyle(color: PPColors.white),
    selectedColor: PPColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: PPColors.white,
  );
}
