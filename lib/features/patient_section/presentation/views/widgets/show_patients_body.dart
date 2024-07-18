import 'package:dentister/features/patient_section/presentation/views/widgets/show_patients_list_view.dart';
import 'package:flutter/material.dart';

class ShowPatientsBody extends StatelessWidget {
  const ShowPatientsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.045,
        vertical: MediaQuery.sizeOf(context).width * 0.05,
      ),
      child: const ShowPatientsListView(),
    );
  }
}
