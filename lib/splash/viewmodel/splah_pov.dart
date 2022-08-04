import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../routes/routes.dart';
import '../../signin_signup/view/signin_screen.dart';

class SplashPov extends ChangeNotifier {
  SplashPov() {
    Timer(
      const Duration(seconds: 3),
      () => Routes.removeScreen(screen: const SignInScreen()),
    );
  }
}
