import 'package:dentister/features/patient_section/presentation/views/widgets/show_patient_widget.dart';
import 'package:flutter/material.dart';

class ShowPatientsListView extends StatelessWidget {
  const ShowPatientsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,counter)=>SizedBox(height: MediaQuery.sizeOf(context).width*0.03,),
      itemBuilder: (context,counter)=>const ShowPatientWidget(),
      itemCount: 5,
    );
  }
}
