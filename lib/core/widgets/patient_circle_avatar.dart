import 'package:dentister/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PatientCircleAvatar extends StatelessWidget {
  final double? radius;
  const PatientCircleAvatar({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? MediaQuery.sizeOf(context).width*0.15,
      child: Icon(Icons.person,size: MediaQuery.sizeOf(context).width*0.2,color: AppColors.darkBlue,),
    );
  }
}