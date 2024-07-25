import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/show_patient_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/model/patient_model.dart';

class ShowPatientsListView extends StatelessWidget {
  final List<PatientModel> patients;
  final PatientCubit cubit;
  const ShowPatientsListView({super.key, required this.patients, required this.cubit});

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      separatorBuilder: (context,counter)=>SizedBox(height: MediaQuery.sizeOf(context).width*0.03,),
      itemBuilder: (context,counter) {
        return InkWell(
          onTap: (){
            cubit.loadParameters(patients[counter]);
            context.push(AppRouter.kEditPatientScreen);
          },
          child: ShowPatientWidget(patient: patients[counter],)
        );
      },
      itemCount: patients.length,
    );
  }
}
