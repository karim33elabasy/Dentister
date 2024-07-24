import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';
import '../../../manager/patient_cubit.dart';

class LabTests extends StatelessWidget {
  final PatientCubit cubit;
  const LabTests({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTff(
            obscureText: false,
            label: "Lab Tests",
            controller: cubit.labTests,
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
