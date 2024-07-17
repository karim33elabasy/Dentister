import 'package:flutter/material.dart';

class MyTff extends StatelessWidget {
  final bool obscureText;
  final String label;
  final TextEditingController controller;
  const MyTff({super.key, required this.obscureText, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
