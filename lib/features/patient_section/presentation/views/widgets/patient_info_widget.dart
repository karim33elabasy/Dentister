import 'package:flutter/material.dart';

class PatientInfoWidget extends StatelessWidget {
  final String text;
  final IconData iconData;

  const PatientInfoWidget({
    super.key,
    required this.text, required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(bottom: width*0.02),
      child: SizedBox(
        width: width*0.8,
        child: Row(
          children: [
            SizedBox(width: width*0.01,),
            Icon(iconData,size: width*0.05,),
            SizedBox(width: width*0.02,),
            SizedBox(
              width: width*0.7,
              child: Text(text,maxLines: 1,style: TextStyle(fontSize: width*0.03,color: Colors.black87,overflow: TextOverflow.ellipsis),),
            ),
          ],
        ),
      ),
    );
  }
}
