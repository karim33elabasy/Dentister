import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';
import '../../../manager/patient_cubit.dart';

class DiagnosticsTab extends StatelessWidget {
  final PatientCubit cubit;
  const DiagnosticsTab({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTff(
            obscureText: false,
            label: "X-rays",
            controller: cubit.xrays,
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Photographs",
            controller: cubit.photographs,
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Lab Test Results",
            controller: cubit.labTest,
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
