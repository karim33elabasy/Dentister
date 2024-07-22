import 'package:dentister/features/patient_section/presentation/views/widgets/show_patients_appbar.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/show_patients_body.dart';
import 'package:flutter/material.dart';

class ShowPatientsScreen extends StatelessWidget {
  const ShowPatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ShowPatientsAppbar(),
              Expanded(
                child: ShowPatientsBody()
              )
            ],
          ),
        ),
      ),
    );
  }
}