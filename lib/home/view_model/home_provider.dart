import 'package:crud/routes/routes.dart';
import 'package:crud/splash/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../signin_signup/viewmodel/firbase_provider.dart';

class HomeScreenPov extends ChangeNotifier {
  void logoutButton(BuildContext context) {
    context.read<OauthPov>().signOut();
    Routes.pushRemove(screen: const SplashScreen());
  }
}
