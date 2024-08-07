import 'package:dentister/core/main_data/cubit/main_cubit.dart';
import 'package:dentister/core/utils/methods.dart';
import 'package:dentister/features/calendar/presentation/manager/visit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../patient_section/presentation/manager/patient_cubit.dart';

class VisitScreenSaveButton extends StatelessWidget {
  const VisitScreenSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    VisitCubit visitCubit = BlocProvider.of<VisitCubit>(context);
    return FloatingActionButton(
      onPressed: (){
        if(visitCubit.patient!=null && visitCubit.visitTimeDT!=null && visitCubit.visitDateDT!=null && visitCubit.visitTitle.text.isNotEmpty){
          visitCubit.addNewVisit();
          BlocProvider.of<PatientCubit>(context).editPatient(patientId: visitCubit.patient!.id, patient: visitCubit.patient);
          BlocProvider.of<MainCubit>(context).getDbData();
          context.pop();
        }else{
          final SnackBar snackBar = mySnackBar(text: "Please enter all the data", context: context);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: const Icon(Icons.save),
    );
  }
}