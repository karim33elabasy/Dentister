import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_states.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/patient_avatar_add_screen.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/contact_info_tab.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/dental_history_tab.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/diagnostics_tab.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/medical_history_tab.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/personal_info_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientScreenBody extends StatelessWidget {
  const PatientScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PatientCubit cubit = BlocProvider.of<PatientCubit>(context);
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.045,
          vertical: MediaQuery.sizeOf(context).width * 0.05,
        ),
      child: Column(
        children: [
          const PatientAvatarAddScreen(),
          SizedBox(height: MediaQuery.sizeOf(context).width * 0.05),
          const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Personal Info'),
              Tab(text: 'Contact Info'),
              Tab(text: 'Medical History'),
              Tab(text: 'Dental History'),
              Tab(text: 'Diagnostics'),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).width * 0.05),
          Expanded(
            child: BlocBuilder<PatientCubit,PatientStates>(
              builder: (context,state){
                return TabBarView(
                  children: [
                    PersonalInfoTab(cubit: cubit,),
                    ContactInfoTab(cubit: cubit),
                    MedicalHistoryTab(cubit: cubit),
                    DentalHistoryTab(cubit: cubit),
                    DiagnosticsTab(cubit: cubit),
                  ],
                );
              }
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: (){},
              padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).width*0.051),
              minWidth: double.infinity,
              // color: AppColors.darkBlue,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black54)),
              child: Text("Save Patient",style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.04,fontWeight: FontWeight.w400),),
            ),
          )
        ],
      ),
    );
  }
}
