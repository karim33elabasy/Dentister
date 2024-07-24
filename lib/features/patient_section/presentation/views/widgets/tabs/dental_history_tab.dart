import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';
import '../../../manager/patient_cubit.dart';

class DentalHistoryTab extends StatelessWidget {
  final PatientCubit cubit;
  const DentalHistoryTab({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.dentalHistoryFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTff(
              obscureText: false,
              label: "Previous Dental Treatments",
              controller: cubit.dentalHistory,
              minLines: 1,
              maxLines: 3,
            ),
            MyTff(
              obscureText: false,
              label: "Dental notes",
              controller: cubit.dentalNotes,
              minLines: 1,
              maxLines: 3,
            ),
            MyTff(
              obscureText: false,
              label: "Last dental visit",
              controller: cubit.lastVisitDateTime,
              minLines: 1,
              maxLines: 1,
              onTap: () async {
                cubit.lastVisit = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());
                if (cubit.lastVisit != null) {
                  cubit.lastVisitDateTime.text =
                  "${cubit.lastVisit!.day}/${cubit.lastVisit!.month}/${cubit.lastVisit!.year}";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
