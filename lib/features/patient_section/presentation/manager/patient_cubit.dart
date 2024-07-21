import 'package:bloc/bloc.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_states.dart';
import 'package:flutter/cupertino.dart';

class PatientCubit extends Cubit<PatientStates>{
  PatientCubit():super(PatientStateInitial());
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController medicalCondition = TextEditingController();
  TextEditingController currentMedication = TextEditingController();
  TextEditingController familyMedicalHistory = TextEditingController();
  TextEditingController allergies = TextEditingController();
  TextEditingController previousDentalttt = TextEditingController();
  TextEditingController dentalConditions = TextEditingController();
  TextEditingController previousXrays = TextEditingController();
  TextEditingController xrays = TextEditingController();
  TextEditingController photographs = TextEditingController();
  TextEditingController labTest = TextEditingController();

  addNewPatient(PatientModel patient){
    emit(PatientStateLoading());
  }

  editPatient(int patientId,PatientModel patient){
    emit(PatientStateLoading());
  }

  deletePatient(int patientId){
    emit(PatientStateLoading());
  }
}