import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Text(
      "Personal Informations :",
      style: TextStyle(
        fontSize: width*0.01
      ),
    );
  }
}
