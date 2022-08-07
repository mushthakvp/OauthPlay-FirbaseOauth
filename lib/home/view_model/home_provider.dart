import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/routes/routes.dart';
import 'package:crud/splash/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../signin_signup/viewmodel/firbase_provider.dart';

String emailFb = 'musthak@gmail.com';

class HomeScreenPov extends ChangeNotifier {
  void logoutButton(BuildContext context) {
    context.read<OauthPov>().signOut();
    Routes.pushRemove(screen: const SplashScreen());
  }

  // getSharedData() async {
  //   final obj = await SharedPreferences.getInstance();
  //   return Future.value(obj.getString('email'));
  // }

  final dbObj = FirebaseFirestore.instance.collection(emailFb);
}
