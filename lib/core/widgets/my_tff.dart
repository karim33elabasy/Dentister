import 'package:flutter/material.dart';

class MyTff extends StatelessWidget {
  final bool obscureText;
  final String label;
  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final double? bottomPadding;
  final bool? enabled;
  final void Function()? onTap;
  const MyTff({super.key, required this.obscureText, required this.label, required this.controller, required this.maxLines, required this.minLines, this.bottomPadding, this.enabled, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding ?? MediaQuery.sizeOf(context).width*0.05
      ),
      child: TextFormField(
        onTap: onTap,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
