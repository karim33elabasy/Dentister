abstract class VisitStates{}
class VisitStatesInitial extends VisitStates{}
class VisitStatesLoading extends VisitStates{}
class VisitStatesSuccess extends VisitStates{
  final int id;
  final bool isEditing;
  VisitStatesSuccess({required this.id,required this.isEditing});
}
class VisitStatesFail extends VisitStates{
  final String error;
  VisitStatesFail({required this.error});
}