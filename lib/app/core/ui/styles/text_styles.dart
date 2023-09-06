import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._(); ///singleton, ninguem pode estanciar essa classe a não ser ela mesma

  static TextStyles get instanceTextStyles {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => "mplus1";

  TextStyle get textLight => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: font,
      );
  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: font,
      );
  TextStyle get textMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: font,
      );
  TextStyle get textSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: font,
      );
  TextStyle get textBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: font,
      );
  TextStyle get textExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: font,
      );
  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
}

///Facilitar na hora da chamada, vamos chamar assim: context.textStyles.textLight
extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instanceTextStyles;
}
