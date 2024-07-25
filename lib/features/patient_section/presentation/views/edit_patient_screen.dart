import 'package:dentister/features/patient_section/presentation/views/widgets/edit_patient_button.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/patient_appbar.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/patient_screen_body.dart';
import 'package:flutter/material.dart';

class EditPatientScreen extends StatelessWidget {
  const EditPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: Scaffold(
        floatingActionButton: EditPatientButton(),
        body: SafeArea(
          child: Column(
            children: [
              PatientAppbar(title: "Edit Patient"),
              Expanded(
                  child: PatientScreenBody()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
