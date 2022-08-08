import 'dart:async';
import 'package:crud/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/routes.dart';
import '../../signin_signup/view/signin_screen.dart';

class SplashPov extends ChangeNotifier {
  bool isLogin = false;
  SplashPov() {
    Timer(
      const Duration(seconds: 3),
      () => Routes.pushRemove(
        screen: isLogin ? const HomeScreen() : const SignInScreen(),
      ),
    );
    sharedFunction();
  }

  sharedFunction() async {
    final obj = await SharedPreferences.getInstance();
    isLogin = obj.getBool('login') ?? false;
  }
}
