import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/home/view_model/home_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OauthPov extends ChangeNotifier {
  final FirebaseAuth _auth;

  OauthPov(this._auth);
  bool isLoading = false;
  bool isLoadingUp = false;

  Future<String> signIn({required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await sharedFunction(email);
      isLoading = false;
      notifyListeners();

      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      isLoading = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }

  Future<String> signUp({required String email, required String password, required String name, required String image, required BuildContext context}) async {
    try {
      isLoadingUp = true;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await registerdata(email, password, image, name);

      await sharedFunction(email);
      isLoadingUp = false;
      notifyListeners();

      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      isLoadingUp = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> googleSignin() async {
    try {
      final isLoged = await GoogleSignIn().isSignedIn();
      if (isLoged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        return Future.value('while error occured');
      }
      final cred = await result.authentication;
      await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: cred.accessToken,
          idToken: cred.idToken,
        ),
      );

      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      return Future.value(ex.message);
    }
  }
 
  registerdata(String email, String password, String image, String name) {
    FirebaseFirestore.instance.collection(email).add({
      'password': password,
      'email': email,
      'image': image,
      'name': name,
    });
  }

  sharedFunction(String email) async {
    emailFb = email;
    log(emailFb);
    final obj = await SharedPreferences.getInstance();
    obj.setBool('login', true);
    obj.setString('userName', email);
  }
}
