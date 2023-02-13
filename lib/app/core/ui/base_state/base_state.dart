import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_delivery/app/core/ui/helpers/loader.dart';
import 'package:front_delivery/app/core/ui/helpers/messages.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, Messages {
  late final C controller;
  //o "C" vai ser substituido por homeController
  @override
  void initState() {
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
    super.initState();
  }

  void onReady();
}
