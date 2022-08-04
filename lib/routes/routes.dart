import 'package:flutter/material.dart';

class Routes {
  static nextScreen({required BuildContext context, required var screen}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static removeScreen({required BuildContext context, required var screen}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static popScreen({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}
