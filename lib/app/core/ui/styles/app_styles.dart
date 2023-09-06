import 'package:flutter/material.dart';
import 'package:front_delivery/app/core/ui/styles/colors_app.dart';
import 'package:front_delivery/app/core/ui/styles/text_styles.dart';

class AppStyles {
  static AppStyles? _instance;
  AppStyles._(); ///singleton, ninguem pode estanciar essa classe a não ser ela mesma

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
///Facilitar na hora da chamada, vamos chamar assim: context.appStyles.primaryButton
extension AppStylesExtension on BuildContext {
  AppStyles get appStyles => AppStyles.instanceStyles;
}
