import 'package:dentister/features/patient_section/presentation/manager/show_patients_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/patient_repo_implem.dart';

class ShowPatientsCubit extends Cubit<ShowPatientsStates>{
  final PatientRepoImplem patientRepoImplem;
  ShowPatientsCubit(this.patientRepoImplem):super(ShowPatientStateInitial());

  TextEditingController searchPatients = TextEditingController();

  getPatients()async{
    emit(ShowPatientStateLoading());
    Future.delayed(const Duration(seconds: 2));
    var result = await patientRepoImplem.getPatients(searchPatients.text);
    result.fold(
            (error){emit(ShowPatientStateFailed(error: error.errMsg));},
            (patients) {emit(ShowPatientStateSuccess(patients: patients));}
    );
  }

}