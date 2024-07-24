import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:dentister/features/patient_section/data/repos/patient_repo_implem.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientCubit extends Cubit<PatientStates> {
  final PatientRepoImplem patientRepoImplem;
  PatientCubit(this.patientRepoImplem) : super(PatientStateInitial());

  TextEditingController id = TextEditingController();
  bool _currentPatient = true;
  TextEditingController name = TextEditingController();
  TextEditingController birthDateTime = TextEditingController();
  String? gender;
  DateTime? birth;
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController dentalHistory = TextEditingController();
  TextEditingController medicalHistory = TextEditingController();
  TextEditingController familyHistory = TextEditingController();
  TextEditingController allergies = TextEditingController();
  TextEditingController dentalNotes = TextEditingController();
  TextEditingController lastVisitDateTime = TextEditingController();
  DateTime? lastVisit;
  TextEditingController labTests = TextEditingController();

  late GlobalKey<FormState> personalInfoFormKey= GlobalKey<FormState>();
  late GlobalKey<FormState> contactInfoFormKey= GlobalKey<FormState>();

  set currentPatient(bool value) {
    _currentPatient = value;
    emit(PatientStateInitial());
  }

  bool get currentPatient {
    return _currentPatient;
  }

  addNewPatient() async {
    emit(PatientStateLoading());
    var result = await patientRepoImplem.addNewPatient(_makePatient());
    result.fold((error) {
      emit(PatientStateFailed(error: error.errMsg));
    }, (id) {
      emit(PatientStateSuccessInt(id: id));
      _clearParameters(); // Clear parameters after successful patient addition
    });
  }

  getPatients(String? filter)async{
    emit(PatientStateLoading());
    // you can add a delay here
    var result = await patientRepoImplem.getPatients(filter);
    result.fold(
      (error){emit(PatientStateFailed(error: error.errMsg));},
      (patients) {emit(PatientStateSuccessList(patients: patients));}
    );
  }

  editPatient(int patientId, PatientModel patient)async{
    emit(PatientStateLoading());
    var result = await patientRepoImplem.editPatient(patientId, patient);


  deletePatient(int patientId) {
    emit(PatientStateLoading());
  }

  /// Clears all the parameters to reset the form fields and data
  void _clearParameters() {
    id.clear();
    _currentPatient = true;
    name.clear();
    birthDateTime.clear();
    gender = null;
    birth = null;
    phone.clear();
    email.clear();
    address.clear();
    notes.clear();
    dentalHistory.clear();
    medicalHistory.clear();
    familyHistory.clear();
    allergies.clear();
    dentalNotes.clear();
    lastVisitDateTime.clear();
    lastVisit = null;
    labTests.clear();
  }

  /// Creates a [PatientModel] from the current form data
  PatientModel _makePatient() {
    return PatientModel(
      id: null,
      currentPatient: currentPatient,
      name: name.text,
      gender: gender!,
      dateBirth: birth,
      phone: phone.text,
      email: email.text,
      address: address.text,
      notes: notes.text,
      dentalHistory: dentalHistory.text,
      medicalHistory: medicalHistory.text,
      familyHistory: familyHistory.text,
      allergies: allergies.text,
      dentalNotes: dentalNotes.text,
      lastVisit: lastVisit,
      labTest: labTests.text,
    );
  }

}

