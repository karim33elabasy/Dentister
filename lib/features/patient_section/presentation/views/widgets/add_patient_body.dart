import 'package:dentister/core/widgets/my_tff.dart';
import 'package:flutter/material.dart';

class AddPatientBody extends StatelessWidget {
  const AddPatientBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width*0.045,
        vertical: MediaQuery.sizeOf(context).height*0.02
      ),
      child: Column(
        children: [
          MyTff(obscureText:false,label: "Name",controller: TextEditingController(),)
        ],
      ),
    );
  }
}
