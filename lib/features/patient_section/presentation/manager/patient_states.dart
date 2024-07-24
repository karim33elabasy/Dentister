import 'package:dentister/features/patient_section/data/model/patient_model.dart';

abstract class PatientStates{}
class PatientStateInitial extends PatientStates{}
class PatientStateLoading extends PatientStates{}
class PatientStateSuccessInt extends PatientStates{
  final int id;
  PatientStateSuccessInt({required this.id});
}
class PatientStateSuccessList extends PatientStates{
  final List<PatientModel> patients;
  PatientStateSuccessList({required this.patients});
}
class PatientStateFailed extends PatientStates{
  final String error;
  PatientStateFailed({required this.error});
}
