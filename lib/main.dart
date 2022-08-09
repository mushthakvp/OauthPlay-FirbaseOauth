import 'package:crud/home/view_model/home_provider.dart';
import 'package:crud/home/view_model/image_provider.dart';
import 'package:crud/routes/routes.dart';
import 'package:crud/signin_signup/viewmodel/firbase_provider.dart';
import 'package:crud/signin_signup/viewmodel/signup_provider.dart';
import 'package:crud/signin_signup/viewmodel/userimage_provider.dart';
import 'package:crud/splash/view/splash_screen.dart';
import 'package:crud/splash/viewmodel/splah_pov.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        ChangeNotifierProvider<OauthPov>(create: (context) => OauthPov(FirebaseAuth.instance)),
        ChangeNotifierProvider<HomeScreenPov>(create: (context) => HomeScreenPov()),
        ChangeNotifierProvider<UserImagePov>(create: (context) => UserImagePov()),
        ChangeNotifierProvider<UserImagePovHome>(create: (context) => UserImagePovHome()),
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
