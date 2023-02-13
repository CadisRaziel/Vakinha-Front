import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    isOpen = true;
    showDialog(
        context: context,
        builder: ((context) {
          return LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white, size: 60);
        }));
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      //eu tenho o context aqui porque é um mixin que extends de Statefulwidget / state
      Navigator.of(context).pop();
    }
  }
}
