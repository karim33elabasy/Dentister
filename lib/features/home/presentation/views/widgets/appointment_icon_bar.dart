import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/features/calendar/data/model/visit_model.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppointmentIconBar extends StatelessWidget {
  final PatientModel patient;
  final VisitModel visit;
  const AppointmentIconBar({super.key, required this.patient, required this.visit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (){
            PatientCubit patientCubit = BlocProvider.of<PatientCubit>(context);
            patientCubit.loadParameters(patient);
            context.push(AppRouter.kEditPatientScreen);
          },
          icon: const Icon(Icons.person),
        ),
        IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.calendar_month_outlined),
        ),
        IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.delete_forever),
        ),
      ],
    );
  }
}