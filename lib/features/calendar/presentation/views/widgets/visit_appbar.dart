import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VisitAppbar extends StatelessWidget {
  final String title;
  const VisitAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: width*0.015,
            vertical: height*0.005
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: (){
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios_rounded,size: width*0.05,)
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
