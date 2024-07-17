import 'package:dentister/core/utils/app_colors.dart';
import 'package:dentister/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPatientFloatingButton extends StatelessWidget {
  const AddPatientFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        context.push(AppRouter.kAddPatientScreen);
      },
      backgroundColor: AppColors.blue,
      child: const Icon(Icons.add_rounded,color: Colors.white,),
    );

  }
}