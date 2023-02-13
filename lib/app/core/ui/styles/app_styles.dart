import 'package:flutter/material.dart';
import 'package:front_delivery/app/core/ui/styles/colors_app.dart';
import 'package:front_delivery/app/core/ui/styles/text_styles.dart';

class AppStyles {
  static AppStyles? _instance;
  AppStyles._();

  static AppStyles get instanceStyles {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: ColorsApp.instanceColor.primary,
        textStyle: TextStyles.instanceTextStyles.textButtonLabel,
      );
}

extension AppStylesExtension on BuildContext {
  AppStyles get colors => AppStyles.instanceStyles;
}
