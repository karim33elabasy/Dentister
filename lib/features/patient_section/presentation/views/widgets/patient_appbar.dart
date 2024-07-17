import 'package:flutter/material.dart';

class PatientAppbar extends StatelessWidget {
  const PatientAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      color: Colors.red,
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
        vertical: height*0.005
      ),
      child: Text(),
    );
  }
}
