import 'package:flutter/material.dart';

class TextFieldWidgetHome extends StatelessWidget {
  final TextInputType type;
  final String hint;
  final TextEditingController contoller;
  final Size size;
  final IconData icon;
  const TextFieldWidgetHome({
    Key? key,
    required this.icon,
    required this.size,
    required this.contoller,
    required this.hint,
    required this.type,
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
        color: Colors.purple.withOpacity(.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          readOnly: true,
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
            hintStyle: const TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
