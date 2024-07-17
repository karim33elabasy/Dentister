import 'package:dentister/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SaveEditFloatingButton extends StatelessWidget {
  const SaveEditFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){

      },
      backgroundColor: AppColors.blue,
      tooltip: "Save",
      child: const Icon(Icons.save,color: Colors.white,),
    );
  }
}
