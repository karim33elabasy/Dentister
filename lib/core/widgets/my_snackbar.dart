import 'package:dentister/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MySnackbar extends StatelessWidget {
  final String text;
  const MySnackbar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text,style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.03,color: Colors.white),),
      action: SnackBarAction(label: "Ok",onPressed: (){},),
      backgroundColor: AppColors.teal,
    );
  }
}
