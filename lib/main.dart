import 'package:flutter/material.dart';
import 'package:front_delivery/app/app_widget.dart';
import 'package:front_delivery/app/core/config/env/env.dart';

Future<void> main() async {
  Env.instanceEnv.load();
  runApp(const AppWidget());
}
