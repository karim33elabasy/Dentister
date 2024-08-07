import 'package:dentister/core/main_data/cubit/main_state.dart';
import 'package:dentister/core/main_data/repo/main_repo_implem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState>{
  final MainRepoImplem mainRepoImplem;
  MainCubit(this.mainRepoImplem):super(MainStateInitial());

  getDbData()async{
    try{
      emit(MainStateLoading());
      var data = await mainRepoImplem.getDbData();
      data.fold(
          (error){emit(MainStateFail(error: error.errMsg));},
          (data){emit(MainStateSuccess(data));}
      );
    }
    catch(exception){
      emit(MainStateFail(error: "Getting data error. ${exception.toString()}"));
    }
  }
}