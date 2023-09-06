import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  ColorsApp._(); ///singleton, ninguem pode estanciar essa classe a não ser ela mesma

  static ColorsApp get instanceColor {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF007D21);
  Color get secondary => const Color(0xFFF88B0C);
}


///Facilitar na hora da chamada, vamos chamar assim: context.colors.primary
extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instanceColor;
}
