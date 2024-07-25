
abstract class PatientStates{}
class PatientStateInitial extends PatientStates{}
class PatientStateLoading extends PatientStates{}
class PatientStateSuccessInt extends PatientStates{
  final int id;
  final bool isEditing;
  PatientStateSuccessInt({required this.id, required this.isEditing});
}
class PatientStateFailed extends PatientStates{
  final String error;
  PatientStateFailed({required this.error});
}
