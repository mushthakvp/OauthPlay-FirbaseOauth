import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static push({required var screen}) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushReplace({required var screen}) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static pushRemove({required var screen}) {
    navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => screen), (route) => false);
  }

  static pop() {
    navigatorKey.currentState?.pop();
  }
}
