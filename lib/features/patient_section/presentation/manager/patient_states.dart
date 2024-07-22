abstract class PatientStates{}
class PatientStateInitial extends PatientStates{}
class PatientStateLoading extends PatientStates{}
class PatientStateSuccess extends PatientStates{
  final int id;
  PatientStateSuccess({required this.id});
}
class PatientStateFailed extends PatientStates{
  final String error;
  PatientStateFailed({required this.error});
}
