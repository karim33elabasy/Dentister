import 'package:flutter/material.dart';

import '../../../../../../core/widgets/my_tff.dart';
import '../section_title.dart';

class DentalHistoryTab extends StatelessWidget {
  const DentalHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTff(
            obscureText: false,
            label: "Previous Dental Treatments",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Dental Conditions",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Previous X-rays and Imaging",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
