import 'package:crud/routes/routes.dart';
import 'package:crud/signin_signup/view/signup_screen.dart';
import 'package:crud/signin_signup/view/widgets/textfield.dart';
import 'package:crud/signin_signup/viewmodel/firbase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/signup_provider.dart';
import 'widgets/oauth_icons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: AnimatedTextKit(
                  totalRepeatCount: 500,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Sign in',
                      textStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                      colors: [
                        Colors.white,
                        Colors.grey,
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TextFieldWidget(
              size: size,
              contoller: context.read<SigningPov>().emailController,
              hint: 'Email',
              type: TextInputType.emailAddress,
              icon: Icons.email_outlined,
              obsecure: false,
            ),
            TextFieldWidget(
              size: size,
              contoller: context.read<SigningPov>().passwordController,
              hint: 'Password',
              type: TextInputType.visiblePassword,
              icon: Icons.lock_outline,
              obsecure: true,
            ),
            Consumer<OauthPov>(
              builder: (context, value, child) => Column(
                children: [
                  value.isLoading
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 34,
                            vertical: 8,
                          ),
                          height: 50,
                          child: const Center(
                            child: CupertinoActivityIndicator(
                              radius: 15,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            context.read<SigningPov>().callFirbase(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 34,
                              vertical: 8,
                            ),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white.withOpacity(.5),
                            ),
                            child: const Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 34, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account? ',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.6),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Routes.push(
                      screen: const SignUpScreen(),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: const [
                  SizedBox(height: 50),
                  OauthIconsWidget(),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
