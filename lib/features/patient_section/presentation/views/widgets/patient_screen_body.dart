import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_states.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/patient_avatar_add_screen.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/contact_info_tab.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/dental_history_tab.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/lab_tests.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/medical_history_tab.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/tabs/personal_info_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/methods.dart';

class PatientScreenBody extends StatelessWidget {
  const PatientScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PatientCubit cubit = BlocProvider.of<PatientCubit>(context);
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(
        right: width * 0.045,
        left: width * 0.045,
        top: width * 0.05,
      ),
      child: Column(
        children: [
          const PatientAvatarAddScreen(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: width * 0.05),
            child: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Personal Info'),
                Tab(text: 'Contact Info'),
                Tab(text: 'Medical History'),
                Tab(text: 'Dental History'),
                Tab(text: 'Lab Tests'),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<PatientCubit, PatientStates>(
              builder: (context, state) {
                return TabBarView(
                  children: [
                    PersonalInfoTab(cubit: cubit,),
                    ContactInfoTab(cubit: cubit),
                    MedicalHistoryTab(cubit: cubit),
                    DentalHistoryTab(cubit: cubit),
                    LabTests(cubit: cubit),
                  ],
                );
              },
              listener: (context, state) {
                if (state is PatientStateSuccessInt) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      mySnackBar(text: state.isEditing? "Patient modified successfully":"Patient added with id: ${state.id}",
                      context: context));
                  context.pop();
                } else if (state is PatientStateFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      mySnackBar(text: "Patient added with id: ${state.error}",context: context));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

