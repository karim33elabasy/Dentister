import 'package:dentister/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';

class PersonalInfoTab extends StatelessWidget {
  const PersonalInfoTab({super.key});

  @override

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Current Patient ?", style: TextStyle(fontSize: MediaQuery.sizeOf(context).width * 0.04)),
              Switch(value: true, onChanged: (value) {}),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).width*0.05),
          MyTff(
            obscureText: false,
            label: "Patient ID",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 1,
            enabled: false,
          ),
          MyTff(
            obscureText: false,
            label: "Full Name",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 1,
          ),
          MyTff(
            obscureText: false,
            label: "Date of Birth",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 1,
            onTap: (){
              showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime.now());
            },
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              fillColor: Colors.white,
              label: const Text("Select gender"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: null,
      
            items: const [
              DropdownMenuItem(child: Text("Male"), value: "male"),
              DropdownMenuItem(child: Text("Female"), value: "female"),
            ],
            onChanged: (String? value) {},
          ),
          SizedBox(height: MediaQuery.sizeOf(context).width*0.05,),
        ],
      ),
    );
  }
}
