import 'package:dentister/core/utils/app_colors.dart';
import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/features/calendar/presentation/manager/visit_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainScreenFloatingButtons extends StatelessWidget {
  const MainScreenFloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: "addNewPatient",
          onPressed: (){
            BlocProvider.of<PatientCubit>(context).clearParameters();
            context.push(AppRouter.kAddPatientScreen);
          },
          mini: true,
          backgroundColor: AppColors.blue,
          child: const Icon(Icons.person_add_alt_1,color: Colors.white,),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height*0.007,),
        FloatingActionButton(
          heroTag: "addNewEvent",
          onPressed: (){
            BlocProvider.of<VisitCubit>(context).clearParameters();
            context.push(AppRouter.kAddVisitScreen);
          },
          backgroundColor: AppColors.blue,
          child: const Icon(Icons.add_card_rounded,color: Colors.white,),
        ),
      ],
    );

  }
}