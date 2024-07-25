import 'package:dentister/core/utils/validation.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';

class PersonalInfoTab extends StatelessWidget {
  final PatientCubit cubit;
  const PersonalInfoTab({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: cubit.personalInfoFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Current Patient ?",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).width * 0.04)),
                Switch(
                    value: cubit.currentPatient,
                    onChanged: (value) {
                      cubit.currentPatient = value;
                    }),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.05),
            MyTff(
              obscureText: false,
              label: "Patient ID",
              controller: cubit.id,
              minLines: 1,
              maxLines: 1,
              enabled: false,
            ),
            MyTff(
              obscureText: false,
              label: "Full Name",
              controller: cubit.name,
              minLines: 1,
              maxLines: 1,
              validator: Validation.validateName,
              requiredField: true,
            ),
            DropdownButtonFormField<String>(
              validator: Validation.validateGender,
              decoration: InputDecoration(
                helperText: "Required Field",
                fillColor: Colors.white,
                label: const Text("Select gender"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: cubit.gender,
              items: const [
                DropdownMenuItem(value: "male", child: Text("Male")),
                DropdownMenuItem(value: "female", child: Text("Female")),
              ],
              onChanged: (value) {
                cubit.gender = value;
              },
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.05,
            ),
            MyTff(
              validator: Validation.validateBirthDate,
              obscureText: false,
              label: "Date of Birth",
              controller: cubit.birthDateTime,
              minLines: 1,
              maxLines: 1,
              onTap: () async {
                cubit.birth = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());
                if (cubit.birth != null) {
                  cubit.birthDateTime.text =
                  "${cubit.birth!.day}/${cubit.birth!.month}/${cubit.birth!.year}";
                }
              },
            ),
            MyTff(
              obscureText: false,
              label: "Notes about patient",
              controller: cubit.notes,
              minLines: 1,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
