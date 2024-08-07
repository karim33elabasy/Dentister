abstract class MainState{}
class MainStateInitial extends MainState{}
class MainStateSuccess extends MainState{
  final Map<String,dynamic> data;
  MainStateSuccess(this.data);
}
class MainStateLoading extends MainState{}
class MainStateFail extends MainState{
  final String error;
  MainStateFail({required this.error});
}