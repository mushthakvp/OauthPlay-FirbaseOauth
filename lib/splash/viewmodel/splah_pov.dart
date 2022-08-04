import 'dart:async';
import 'package:crud/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../routes/routes.dart';

class SplashPov extends ChangeNotifier {
  SplashPov() {
    Timer(
      const Duration(seconds: 3),
      () => Routes.removeScreen(
        context: context,
        screen: const HomeScreen(),
      ),
    );
  }
}
