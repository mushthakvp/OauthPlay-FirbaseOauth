import 'package:crud/home/view/home_screen.dart';
import 'package:crud/routes/routes.dart';
import 'package:crud/signin_signup/viewmodel/firbase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigningPov extends ChangeNotifier {
  final scafoldKeySign = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isObsecureOne = true;

  obsecureChange() {
    isObsecureOne = !isObsecureOne;
    notifyListeners();
  }

  callFirbase(BuildContext context) async {
    final msg = await context.read<OauthPov>().signIn(
          email: emailController.text,
          password: passwordController.text,
        );

    if (msg != '') {
      // ignore: use_build_context_synchronously
      showPopup(context, msg);
    } else {
      Routes.pushReplace(screen: const HomeScreen());
    }
  }

  callSignUp(BuildContext context) async {
    final msg = await context.read<OauthPov>().signUp(
          email: emailController.text,
          password: passwordController.text,
        );
    if (msg != '') {
      // ignore: use_build_context_synchronously
      showPopup(context, msg);
    } else {
      Routes.pushReplace(screen: const HomeScreen());
    }
  }

  showPopup(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.indigo,
        duration: const Duration(seconds: 1),
        content: Text(msg),
      ),
    );
  }
}
