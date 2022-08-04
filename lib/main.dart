import 'package:crud/routes/routes.dart';
import 'package:crud/signin_signup/viewmodel/signing_provider.dart';
import 'package:crud/splash/view/splash_screen.dart';
import 'package:crud/splash/viewmodel/splah_pov.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashPov>(create: (context) => SplashPov()),
        ChangeNotifierProvider<SigningPov>(create: (context) => SigningPov()),
      ],
      child: MaterialApp(
        navigatorKey: Routes.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
