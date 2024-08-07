import 'package:flutter/material.dart';

class KeyboardAwareWidget extends StatelessWidget {
  final Widget child;

  const KeyboardAwareWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = viewInsets > 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: viewInsets),
      child: SingleChildScrollView(
        reverse: isKeyboardVisible, // Reverses the scroll view to ensure the keyboard pushes the widget up
        child: child,
      ),
    );
  }
}