import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';
import '../../../manager/patient_cubit.dart';

class DentalHistoryTab extends StatelessWidget {
  final PatientCubit cubit;
  const DentalHistoryTab({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTff(
            obscureText: false,
            label: "Previous Dental Treatments",
            controller: cubit.previousDentalttt,
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Dental Conditions",
            controller: cubit.dentalConditions,
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Previous X-rays and Imaging",
            controller: cubit.previousXrays,
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
