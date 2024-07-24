import 'package:dentister/features/patient_section/presentation/views/widgets/show_patient_widget.dart';
import 'package:flutter/material.dart';

import '../../../data/model/patient_model.dart';

class ShowPatientsListView extends StatelessWidget {
  final List<PatientModel> patients;
  const ShowPatientsListView({super.key, required this.patients});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,counter)=>SizedBox(height: MediaQuery.sizeOf(context).width*0.03,),
      itemBuilder: (context,counter)=> ShowPatientWidget(patient: patients[counter],),
      itemCount: patients.length,
    );
  }
}
