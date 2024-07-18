import 'package:dentister/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios_rounded,size: width*0.05,)
            ),
            SizedBox(width: width*0.02,),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    hintText: "Search with name / phone / location"
                ),
              ),
            ),
            SizedBox(width: width*0.02,),
            IconButton(
                onPressed: (){
                  context.push(AppRouter.kAddPatientScreen);
                },
                icon: Icon(Icons.person_add_alt_1_rounded,size: width*0.06,)
            ),

          ],
        )
    );
  }
}
