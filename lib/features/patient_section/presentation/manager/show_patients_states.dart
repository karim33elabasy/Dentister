import '../../data/model/patient_model.dart';

abstract class ShowPatientsStates{}
class ShowPatientStateInitial extends ShowPatientsStates{}
class ShowPatientStateSuccess extends ShowPatientsStates{
  final List<PatientModel> patients;
  ShowPatientStateSuccess({required this.patients});
}
class ShowPatientStateLoading extends ShowPatientsStates{}
class ShowPatientStateFailed extends ShowPatientsStates{
  final String error;
  ShowPatientStateFailed({required this.error});
}