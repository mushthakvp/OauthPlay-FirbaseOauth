import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class OauthPov extends ChangeNotifier {
  final FirebaseAuth _auth;

  OauthPov(this._auth);
  bool isLoading = false;

  Stream<User?> stream() => _auth.authStateChanges();

  Future<String> signIn({required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      isLoading = false;
      notifyListeners();
      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      isLoading = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
