import 'package:dentister/core/utils/validation.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';
import '../../../manager/patient_cubit.dart';

class ContactInfoTab extends StatelessWidget {
  final PatientCubit cubit;
  const ContactInfoTab({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: cubit.contactInfoFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTff(
              validator: Validation.validatePhoneNumber,
              obscureText: false,
              label: "Phone Number",
              controller: cubit.phone,
              minLines: 1,
              maxLines: 1,
            ),
            MyTff(
              validator: Validation.validateEmail,
              obscureText: false,
              label: "Email Address",
              controller: cubit.email,
              minLines: 1,
              maxLines: 1,
            ),
            MyTff(
              obscureText: false,
              label: "Physical Address",
              controller: cubit.address,
              minLines: 1,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

