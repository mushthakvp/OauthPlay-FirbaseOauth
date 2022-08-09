// ignore_for_file: use_build_context_synchronously
import 'package:crud/core/const.dart';
import 'package:crud/home/view/home_screen.dart';
import 'package:crud/routes/routes.dart';
import 'package:crud/signin_signup/viewmodel/firbase_provider.dart';
import 'package:crud/signin_signup/viewmodel/userimage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/view_model/home_provider.dart';

class SigningPov extends ChangeNotifier {
  final scafoldKeySign = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool isObsecureOne = true;

  obsecureChange() {
    isObsecureOne = !isObsecureOne;
    notifyListeners();
  }

  callSignIn(BuildContext context) async {
    final msg = await context.read<OauthPov>().signIn(
          email: emailController.text,
          password: passwordController.text,
        );

    if (msg != '') {
      showPopup(context, msg);
    } else {
      disposeItems(context);
      Routes.pushRemove(screen: const HomeScreen());
    }
  }

  callSignUp(BuildContext context) async {
    final email = emailController.text.trim();
    emailFb = email;
    final name = nameController.text.trim();
    final image = context.read<UserImagePov>().imageToString;
    final passWord = passwordController.text.trim();
    final msg = await context.read<OauthPov>().signUp(
          email: email,
          password: passWord,
          image: image,
          name: name,
          context: context,
        );
    if (msg != '') {
      showPopup(context, msg);
    } else {
      disposeItems(context);
      Routes.pushRemove(screen: const HomeScreen());
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

  disposeItems(BuildContext context) {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    context.read<UserImagePov>().imageToString = encodeImage;
  }
}
