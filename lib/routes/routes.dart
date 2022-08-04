import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static nextScreen({required var screen}) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static removeScreen({required var screen}) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static popScreen() {
    navigatorKey.currentState?.pop();
  }
}
