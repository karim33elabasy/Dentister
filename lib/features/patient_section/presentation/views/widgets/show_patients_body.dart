import 'package:dentister/core/utils/methods.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_states.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/show_patients_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowPatientsBody extends StatefulWidget {
  const ShowPatientsBody({super.key});

  @override
  State<ShowPatientsBody> createState() => _ShowPatientsBodyState();
}

class _ShowPatientsBodyState extends State<ShowPatientsBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PatientCubit>(context).getPatients(null);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.045,
        vertical: MediaQuery.sizeOf(context).width * 0.05,
      ),

      child: BlocConsumer<PatientCubit,PatientStates>(

        builder: (context,state) {
          if (state is PatientStateSuccessList){
            return ShowPatientsListView(patients: state.patients,);
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }

        },

        listener: (context,state){
          if (state is PatientStateFailed){
            ScaffoldMessenger.of(context).showSnackBar(mySnackBar(text: state.error, context: context));
          }
        },
      ),
    );
  }
}
