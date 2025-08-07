import 'package:flutter/painting.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get headline1 => const TextStyle(
        fontSize: 101,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      );

  static TextStyle get headline2 => const TextStyle(
        fontSize: 63,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      );

  static TextStyle get headline3 => const TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get headline4 => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );

  static TextStyle get headline5 => const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get headline6 => const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  static TextStyle get subtitle1 => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  static TextStyle get subtitle2 => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      );

  static TextStyle get bodyText1 => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      );

  static TextStyle get bodyText2 => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );

  static TextStyle get buttonText => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      );

  static TextStyle get captionText => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      );

  static TextStyle get overlineText => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      );
}
