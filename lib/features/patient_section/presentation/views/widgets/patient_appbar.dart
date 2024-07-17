import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientAppbar extends StatelessWidget {
  final String title;
  const PatientAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.05,
        vertical: height*0.005
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: (){
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded,size: width*0.04,)
          ),
          SizedBox(width: width*0.01,),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: width*0.05
            )
          ),
        ],
      )
    );
  }
}
