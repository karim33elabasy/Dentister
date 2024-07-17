import 'package:flutter/material.dart';

class PatientAppbar extends StatelessWidget {
  final String title;
  const PatientAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      color: Colors.red,
      padding: EdgeInsets.symmetric(
        // horizontal: width*0.02,
        vertical: height*0.005
      ),
      child: const ListTile(
        leading: Icon(Icons.arrow_back_ios_rounded),
        title: Text(title,style: TextStyle(),),
      ),
    );
  }
}
