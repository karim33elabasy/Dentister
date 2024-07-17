import 'package:flutter/material.dart';

class MyTff extends StatelessWidget {
  final bool obscureText;
  const MyTff({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
