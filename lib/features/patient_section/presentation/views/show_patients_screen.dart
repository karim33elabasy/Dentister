import 'package:flutter/material.dart';

class ShowPatientsScreen extends StatelessWidget {
  const ShowPatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ShowPatientsAppbar()
          ],
        ),
      ),
    );
  }
}
class ShowPatientsAppbar extends StatelessWidget {
  const ShowPatientsAppbar({super.key});

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
                },
                icon: Icon(Icons.arrow_back_ios_rounded,size: width*0.04,)
            ),
            SizedBox(width: width*0.01,),
            Text(
                "title",
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

