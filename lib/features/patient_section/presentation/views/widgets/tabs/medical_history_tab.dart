import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';
import '../../../manager/patient_cubit.dart';

class MedicalHistoryTab extends StatelessWidget {
  final PatientCubit cubit;
  const MedicalHistoryTab({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTff(
            obscureText: false,
            label: "Medical History",
            controller: cubit.medicalHistory,
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Family Medical History",
            controller: cubit.familyHistory,
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Allergies",
            controller: cubit.allergies,
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
