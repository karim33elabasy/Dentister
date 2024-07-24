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
            // Execute the button Code you want :
            cubit.addNewPatient();
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
