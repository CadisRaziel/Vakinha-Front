import 'package:flutter/material.dart';
import 'package:front_delivery/app/core/ui/styles/app_styles.dart';
import 'package:front_delivery/app/core/ui/styles/colors_app.dart';
import 'package:front_delivery/app/core/ui/styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      color: Colors.grey[400]!,
    ),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: ColorsApp.instanceColor.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instanceColor.primary,
      primary: ColorsApp.instanceColor.primary,
      secondary: ColorsApp.instanceColor.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instanceStyles.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.instanceTextStyles.textRegular.copyWith(
        color: Colors.black,
      ),
      errorStyle: TextStyles.instanceTextStyles.textRegular.copyWith(
        color: Colors.redAccent,
      ),
    ),
  );
}
