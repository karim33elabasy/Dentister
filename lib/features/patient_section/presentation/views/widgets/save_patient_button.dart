import 'package:dentister/core/main_data/cubit/main_cubit.dart';
import 'package:dentister/core/utils/app_colors.dart';
import 'package:dentister/core/utils/validation.dart';
import 'package:dentister/features/patient_section/presentation/manager/show_patients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/patient_cubit.dart';

class SavePatientButton extends StatelessWidget {
  const SavePatientButton({super.key});

  @override
  Widget build(BuildContext context) {
    PatientCubit cubit = BlocProvider.of<PatientCubit>(context);
    MainCubit mainCubit = BlocProvider.of<MainCubit>(context);
    ShowPatientsCubit showPatients = BlocProvider.of<ShowPatientsCubit>(context);
    return FloatingActionButton(
      onPressed: () {
        TabController? tabController = DefaultTabController.of(context);
          if (tabController.index == tabController.length - 1) {
            //Check Validation :
            if (Validation.validateName(cubit.name.text)!=null && Validation.validateGender(cubit.gender)!=null || cubit.name.text.isEmpty || cubit.gender == null){
              tabController.animateTo(tabController.index = 0);
            }
            else if (Validation.validatePhoneNumber(cubit.phone.text) != null && Validation.validateEmail(cubit.email.text) != null){
              tabController.animateTo(tabController.index = 1);
            }
            else{
              // Execute the button Code you want :
              cubit.addNewPatient();
              mainCubit.getDbData();
              showPatients.getPatients();
            }
          } else {
            tabController.animateTo(tabController.index + 1);
          }
      },
      backgroundColor: AppColors.blue,
      child: const Icon(Icons.save,color: Colors.white,),
    );
  }
}
