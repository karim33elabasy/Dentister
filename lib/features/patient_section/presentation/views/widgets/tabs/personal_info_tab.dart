import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/my_tff.dart';

class PersonalInfoTab extends StatelessWidget {
  final PatientCubit cubit;
  const PersonalInfoTab({super.key, required this.cubit});

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
              Switch(value: cubit.currentPatient, onChanged: (value) {cubit.currentPatient = value;}),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).width*0.05),
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
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              fillColor: Colors.white,
              label: const Text("Select gender"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: cubit.gender,

            items: const [
              DropdownMenuItem(child: Text("Male"), value: "male"),
              DropdownMenuItem(child: Text("Female"), value: "female"),
            ],
            onChanged: (value) {
              cubit.gender=value;
            },
          ),
          SizedBox(height: MediaQuery.sizeOf(context).width*0.05,),
          MyTff(
            obscureText: false,
            label: "Date of Birth",
            controller: cubit.birth,
            minLines: 1,
            maxLines: 1,
            onTap: ()async{
              cubit.birthDateTime = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime.now());
              if (cubit.birthDateTime != null){
                cubit.birth.text =
                "${cubit.birthDateTime!.day}/${cubit.birthDateTime!.month}/${cubit.birthDateTime!.year}";
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
    );
  }
}
