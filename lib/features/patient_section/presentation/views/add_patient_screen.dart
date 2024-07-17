import 'package:dentister/features/patient_section/presentation/views/widgets/add_patient_body.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/patient_appbar.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/save_edit_floating_button.dart';
import 'package:flutter/material.dart';

class AddPatientScreen extends StatelessWidget {
  const AddPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: SaveEditFloatingButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PatientAppbar(title: "Patient Details",),
              AddPatientBody(),
            ],
          ),
        ),
      ),
    );
  }
}
