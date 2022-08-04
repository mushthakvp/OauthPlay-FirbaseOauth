import 'package:flutter/cupertino.dart';

class SigningPov extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isObsecureOne = true;

  obsecureChange() {
    isObsecureOne = !isObsecureOne;

    notifyListeners();
  }
}
