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
  final GlobalKey<FormState> contactInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dentalHistoryFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> labTestsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> medicalHistoryFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();


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
      emit(PatientStateSuccess(id: id));
    });
  }

  editPatient(int patientId, PatientModel patient) {
    emit(PatientStateLoading());
  }

  deletePatient(int patientId) {
    emit(PatientStateLoading());
  }

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
        labTest: labTests.text);
  }
}
