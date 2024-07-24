import 'package:dentister/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

SnackBar mySnackBar({required String text,required BuildContext context}){
  return SnackBar(
    content: Text(text,style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.03,color: Colors.white),),
    action: SnackBarAction(label: "Ok",onPressed: (){},),
    backgroundColor: AppColors.teal,
  );
}