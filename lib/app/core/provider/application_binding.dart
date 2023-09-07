import 'package:flutter/material.dart';
import 'package:front_delivery/app/core/rest_client/custom_dio.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///Coloque na ordem correta !
        Provider(create: (context) => CustomDio()),
      ],
      child: child,
    );
  }
}
