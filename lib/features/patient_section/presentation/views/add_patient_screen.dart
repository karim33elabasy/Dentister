import 'package:dentister/features/patient_section/presentation/views/widgets/patient_appbar.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/patient_screen_body.dart';
import 'package:flutter/material.dart';

class AddPatientScreen extends StatelessWidget {
  const AddPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              PatientAppbar(title: "Add Patient"),
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