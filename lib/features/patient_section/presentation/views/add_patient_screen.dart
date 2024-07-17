import 'package:dentister/features/patient_section/presentation/views/widgets/patient_appbar.dart';
import 'package:flutter/material.dart';

class AddPatientScreen extends StatelessWidget {
  const AddPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PatientAppbar()
          ],
        ),
      ),
    );
  }
}
