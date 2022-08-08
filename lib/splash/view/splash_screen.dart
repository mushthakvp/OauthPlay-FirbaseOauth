import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/view/home_screen.dart';
import '../../home/view_model/home_provider.dart';
import '../../routes/routes.dart';
import '../../signin_signup/view/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    sharedFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer<SplashPov>(
    //   builder: (BuildContext context, value, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.indigo,
            ],
            stops: [0.5, 1.0],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/onePlay.png',
            height: 150,
          ),
        ),
      ),
    );
    //   },
    // );
  }

  sharedFunction() async {
    final obj = await SharedPreferences.getInstance();
    final isLogin = obj.getBool('login') ?? false;
     emailFb = obj.getString('userName') ?? '';
    Timer(
      const Duration(seconds: 3),
      () => Routes.pushRemove(
        screen: isLogin ? const HomeScreen() : const SignInScreen(),
      ),
    );
  }
}
