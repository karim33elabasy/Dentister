import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

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
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu,size: width*0.05,)
            ),
            SizedBox(width: width*0.01,),
            Text(
                "Dentister",
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


