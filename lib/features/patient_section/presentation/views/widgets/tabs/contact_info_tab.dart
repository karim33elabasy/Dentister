import 'package:flutter/material.dart';

import '../../../../../../core/widgets/my_tff.dart';
import '../section_title.dart';

class ContactInfoTab extends StatelessWidget {
  const ContactInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTff(
            obscureText: false,
            label: "Phone Number",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 1,
          ),
          MyTff(
            obscureText: false,
            label: "Email Address",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 1,
          ),
          MyTff(
            obscureText: false,
            label: "Physical Address",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

