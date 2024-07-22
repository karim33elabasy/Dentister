import 'package:dentister/core/widgets/my_snackbar.dart';
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
import 'package:go_router/go_router.dart';

class PatientScreenBody extends StatelessWidget {
  const PatientScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PatientCubit cubit = BlocProvider.of<PatientCubit>(context);
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.045,
          vertical: width * 0.05,
        ),
      child: Column(
        children: [
          const PatientAvatarAddScreen(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: width*0.05),
            child: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Personal Info'),
                Tab(text: 'Contact Info'),
                Tab(text: 'Medical History'),
                Tab(text: 'Dental History'),
                Tab(text: 'Diagnostics'),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<PatientCubit,PatientStates>(
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
              },
              listener: (context,state){
                if(state is PatientStateSuccess){
                  ScaffoldMessenger.of(context).showSnackBar(MySnackbar(text: "Patient added with id: ${state.id}") as SnackBar);
                  context.pop();
                }else if (state is PatientStateFailed){
                  ScaffoldMessenger.of(context).showSnackBar(MySnackbar(text: "Patient added with id: ${state.error}") as SnackBar);
                }
              },
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: (){
                TabController? tabController = DefaultTabController.of(context);
                if (tabController != null) {
                  if (tabController.index == tabController.length - 1) {
                    // Execute the button Code you want :
                    cubit.addNewPatient();
                  } else {
                    tabController.animateTo(tabController.index + 1);
                  }
                }
              },
              padding: EdgeInsets.symmetric(vertical: width*0.051),
              minWidth: double.infinity,
              // color: AppColors.darkBlue,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black54)),
              child: Text("Save Patient",style: TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w400),),
            ),
          )
        ],
      ),
    );
  }
}
