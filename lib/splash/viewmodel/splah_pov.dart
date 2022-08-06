import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../routes/routes.dart';

class SplashPov extends ChangeNotifier {
  // SplashPov() {
  //   Timer(
  //     const Duration(seconds: 3),
  //     () => Routes.removeScreen(screen: const SignInScreen()),
  //   );
  // }

  checkScreen(var screen) {
    Timer(
      const Duration(seconds: 3),
      () => Routes.pushReplace(screen: screen),
    );
  }
}
