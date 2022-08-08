import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/home/view_model/image_provider.dart';
import 'package:crud/routes/routes.dart';
import 'package:crud/splash/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../signin_signup/viewmodel/firbase_provider.dart';

String emailFb = '';

class HomeScreenPov extends ChangeNotifier {
  final nameController = TextEditingController();
  final changeNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  void logoutButton(BuildContext context) {
    context.read<OauthPov>().signOut();
    sharedFunction();
    Routes.pushRemove(screen: const SplashScreen());
  }

  sharedFunction() async {
    final obj = await SharedPreferences.getInstance();
    obj.setBool('login', false);
  }

  updateData({
    required String email,
    required String name,
    required BuildContext context,
    required String image,
    required String document,
    required String password,
  }) {
    log(document.toString());
    final finalName = changeNameController.text.isEmpty ? name : changeNameController.text;
    String finalImage = context.read<UserImagePovHome>().imageToString.trim().isEmpty ? image : context.read<UserImagePovHome>().imageToString;
    FirebaseFirestore.instance.collection(email).doc(document).set({
      'password': password,
      'email': email,
      'image': finalImage,
      'name': finalName,
    });
  }

  final dbObj = FirebaseFirestore.instance.collection(emailFb);
}
