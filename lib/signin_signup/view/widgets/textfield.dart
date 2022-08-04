import 'package:crud/signin_signup/viewmodel/signing_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType type;
  final String hint;
  final TextEditingController contoller;
  final Size size;
  final IconData icon;
  final bool obsecure;
  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.size,
    required this.contoller,
    required this.hint,
    required this.type,
    required this.obsecure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: obsecure
            ? Consumer<SigningPov>(
                builder: (BuildContext context, value, Widget? child) => TextField(
                  obscureText: context.read<SigningPov>().isObsecureOne,
                  controller: contoller,
                  keyboardType: type,
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .8,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: Colors.white.withOpacity(0.4),
                      icon: Icon(value.isObsecureOne ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        value.obsecureChange();
                      },
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            : TextField(
                controller: contoller,
                keyboardType: type,
                style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .8,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    icon,
                    color: Colors.white,
                  ),
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 14,
                  ),
                ),
              ),
      ),
    );
  }
}
