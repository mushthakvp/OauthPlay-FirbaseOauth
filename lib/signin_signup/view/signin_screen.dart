import 'package:crud/signin_signup/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/signing_provider.dart';
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
        child: ListView(
          children: [
            SizedBox(height: size.width / 4),
            Center(
              child: AnimatedTextKit(
                totalRepeatCount: 500,
                isRepeatingAnimation: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Create Account',
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
            SizedBox(height: size.width / 5),
            TextFieldWidget(
              size: size,
              contoller: context.read<SigningPov>().nameController,
              hint: 'Name',
              type: TextInputType.emailAddress,
              icon: Icons.person,
              obsecure: false,
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
            TextFieldWidget(
              size: size,
              contoller: context.read<SigningPov>().confirmPasswordController,
              hint: 'Confirm Password',
              type: TextInputType.visiblePassword,
              icon: Icons.lock_outline,
              obsecure: true,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
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
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 34, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.6),
                    ),
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const OauthIconsWidget()
          ],
        ),
      ),
    );
  }
}
