import 'package:flutter/material.dart';

import '../../../../../../core/widgets/my_tff.dart';

class DiagnosticsTab extends StatelessWidget {
  const DiagnosticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTff(
            obscureText: false,
            label: "X-rays",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Photographs",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
          MyTff(
            obscureText: false,
            label: "Lab Test Results",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
