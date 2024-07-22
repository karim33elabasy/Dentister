import 'package:dartz/dartz.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:dentister/features/patient_section/data/repos/patient_repo_implem.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientCubit extends Cubit<PatientStates>{
  final PatientRepoImplem patientRepoImplem;
  PatientCubit(this.patientRepoImplem):super(PatientStateInitial());
  TextEditingController id = TextEditingController();
  bool _currentPatient = true;
  TextEditingController name = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController notes = TextEditingController();
  DateTime? birthDateTime;
  String? gender;
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

  set currentPatient(bool value){
    _currentPatient = value;
    emit(PatientStateInitial());
  }
  bool get currentPatient{
    return _currentPatient;
  }
  addNewPatient()async{
    emit(PatientStateLoading());
    var result = await patientRepoImplem.addNewPatient(_makePatient());
    result.fold(
      (error){emit(PatientStateFailed(error: error.errMsg));},
      (id){emit(PatientStateSuccess(id: id));}
    );
  }

  editPatient(int patientId,PatientModel patient){
    emit(PatientStateLoading());
  }

  deletePatient(int patientId){
    emit(PatientStateLoading());
  }

  PatientModel _makePatient(){
    return PatientModel(id: null, currentPatient: currentPatient, name: name.text, gender: gender!, dateBirth: birthDateTime, phone: phone.text, email: email.text, address: address.text, notes: notes.text, dentalHistory: previousDentalttt.text, medicalHistory: medicalCondition.text, familyHistory: familyMedicalHistory.text, allergies: allergies.text, dentalNotes: dentalConditions.text, lastVisit: birthDateTime, labTest: labTest.text);
  }
}

