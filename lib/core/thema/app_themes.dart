import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:dating_app/resources/fonts.dart';
import 'package:dating_app/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData theme() {
  return ThemeData(
      useMaterial3: true,
      fontFamily: FontFamily.nunito,
      primaryColor: ColorName.primary,
      focusColor: ColorName.primary,
      scaffoldBackgroundColor: ColorName.white,
      elevatedButtonTheme: elevatedButtonTheme(),
      appBarTheme: appBarTheme(),
      cardTheme: CardThemeData(),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headline1,
        displayMedium: AppTextStyles.headline2,
        displaySmall: AppTextStyles.headline3,
        headlineLarge: AppTextStyles.headline4,
        headlineMedium: AppTextStyles.headline5,
        headlineSmall: AppTextStyles.headline6,
        titleMedium: AppTextStyles.subtitle1,
        titleSmall: AppTextStyles.subtitle2,
        bodyMedium: AppTextStyles.bodyText1,
        bodySmall: AppTextStyles.bodyText2,
        labelLarge: AppTextStyles.buttonText,
        labelMedium: AppTextStyles.captionText,
        labelSmall: AppTextStyles.overlineText,
      ), tabBarTheme: TabBarThemeData(indicatorColor: ColorName.primary));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      backgroundColor: ColorName.white,
      elevation: 0,
      centerTitle: true,
      iconTheme:
      IconThemeData(color: ColorName.black, size: Dimens.iconSizeSmall),
      titleTextStyle: AppTextStyles.headline2
          .copyWith(fontFamily: FontFamily.nunito, color: ColorName.black),
      systemOverlayStyle: SystemUiOverlayStyle.light);
}

CardTheme cardTheme() {
  return CardTheme(
    surfaceTintColor: ColorName.white,
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        ColorName.primary,
      ),
      elevation: WidgetStateProperty.all(1),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(Dimens.buttonBorderRadius)),
        ),
      ),
      textStyle: WidgetStateProperty.all(
        AppTextStyles.headline2.copyWith(
          color: ColorName.white,
        ),
      ),
    ),
  );
}
