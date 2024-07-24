import 'package:dentister/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/patient_cubit.dart';

class SavePatientButton extends StatelessWidget {
  const SavePatientButton({super.key});

  @override
  Widget build(BuildContext context) {
    PatientCubit cubit = BlocProvider.of<PatientCubit>(context);
    return FloatingActionButton(
      onPressed: () {
        TabController? tabController = DefaultTabController.of(context);
        if (tabController != null) {
          if (tabController.index == tabController.length - 1) {
            //Check Validation :

            print("/"*1000);
            print("personalInfo: ${cubit.personalInfoFormKey.currentState?.validate()}");
            print(cubit.name.toString());
            print("contactInfo: ${cubit.contactInfoFormKey.currentState?.validate()}");
            print(cubit.phone.toString());

            if (cubit.personalInfoFormKey.currentState?.validate() != null){
              print("In1 "*200);
              tabController.animateTo(tabController.index = 0);
            }
            else if (cubit.contactInfoFormKey.currentState?.validate() != null){
              print("In2 "*200);
              tabController.animateTo(tabController.index = 1);
            }
            else{
              // Execute the button Code you want :
              cubit.addNewPatient();
            }
          } else {
            tabController.animateTo(tabController.index + 1);
          }
        }
      },
      backgroundColor: AppColors.blue,
      child: const Icon(Icons.save,color: Colors.white,),
    );
  }
}