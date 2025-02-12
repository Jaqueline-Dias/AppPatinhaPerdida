import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/constants.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: PPColors.darkGrey,
    suffixIconColor: PPColors.darkGrey,
    fillColor: PPColors.primaryBackground,
    isDense: true,
    filled: true,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: PPSizes.fontSizeMd, color: PPColors.primary),
    hintStyle: const TextStyle()
        .copyWith(fontSize: PPSizes.fontSizeSm, color: PPColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: PPColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PPColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PPColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PPColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PPColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: PPColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: PPColors.darkGrey,
    suffixIconColor: PPColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: PPSizes.fontSizeMd, color: PPColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: PPSizes.fontSizeSm, color: PPColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: PPColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PPColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PPColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PPColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PPColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PPSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: PPColors.warning),
    ),
  );
}
