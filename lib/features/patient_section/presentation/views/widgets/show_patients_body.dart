import 'package:dentister/core/utils/methods.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/show_patients_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/show_patients_states.dart';
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
    BlocProvider.of<ShowPatientsCubit>(context).getPatients();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.045,
        vertical: MediaQuery.sizeOf(context).width * 0.05,
      ),

      child: BlocConsumer<ShowPatientsCubit,ShowPatientsStates>(

        builder: (context,state) {
          if (state is ShowPatientStateSuccess){
            if (state.patients.isNotEmpty){
              return ShowPatientsListView(patients: state.patients, cubit: BlocProvider.of<PatientCubit>(context),);
            }else{
              return Center(child: Text("No Data Found",style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.06,color: Colors.black12,fontWeight: FontWeight.w700),));
            }

          } else {
            return const Center(child: CircularProgressIndicator(),);
          }

        },

        listener: (context,state){
          if (state is ShowPatientStateFailed){
            ScaffoldMessenger.of(context).showSnackBar(mySnackBar(text: state.error, context: context));
          }
        },
      ),
    );
  }
}
