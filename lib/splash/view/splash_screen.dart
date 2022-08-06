import 'package:crud/home/view/home_screen.dart';
import 'package:crud/signin_signup/view/signin_screen.dart';
import 'package:crud/signin_signup/viewmodel/firbase_provider.dart';
import 'package:crud/splash/viewmodel/splah_pov.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: context.read<OauthPov>().stream(),
      builder: (context, snapshot) {
        context.read<SplashPov>().checkScreen(
              !snapshot.hasData ? const SignInScreen() : const HomeScreen(),
            );
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
      },
    );
  }
}
