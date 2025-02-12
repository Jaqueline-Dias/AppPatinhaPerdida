import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/constants.dart';
import 'package:patinha_app/src/core/theme/widgets_theme/widgets_theme.dart';

class PPAppTheme {
  PPAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    disabledColor: PPColors.grey,
    brightness: Brightness.light,
    primaryColor: PPColors.primary,
    textTheme: PPextTheme.lightTextTheme,
    chipTheme: PPChipTheme.lightChipTheme,
    scaffoldBackgroundColor: PPColors.white,
    appBarTheme: PPAppBarTheme.lightAppBarTheme,
    checkboxTheme: PPCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: PPBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: PPElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: PPOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    disabledColor: PPColors.grey,
    brightness: Brightness.dark,
    primaryColor: PPColors.primary,
    textTheme: PPextTheme.darkTextTheme,
    chipTheme: PPChipTheme.darkChipTheme,
    scaffoldBackgroundColor: PPColors.black,
    appBarTheme: PPAppBarTheme.darkAppBarTheme,
    checkboxTheme: PPCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: PPBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: PPElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: PPOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
