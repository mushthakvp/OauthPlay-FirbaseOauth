import 'package:crud/splash/viewmodel/splah_pov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashPov>(builder: (BuildContext context, value, Widget? child) {
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
    });
  }
}
