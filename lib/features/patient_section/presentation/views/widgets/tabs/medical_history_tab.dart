import 'package:flutter/material.dart';

import '../../../../../../core/widgets/my_tff.dart';
import '../section_title.dart';

class MedicalHistoryTab extends StatelessWidget {
  const MedicalHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTff(
            obscureText: false,
            label: "Medical Conditions",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Current Medications",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Family Medical History",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Allergies",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
