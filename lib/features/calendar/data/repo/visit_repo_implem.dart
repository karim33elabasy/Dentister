import 'package:dartz/dartz.dart';
import 'package:dentister/core/failure/failure.dart';
import 'package:dentister/core/utils/db_services.dart';
import 'package:dentister/features/calendar/data/model/visit_model.dart';
import 'package:dentister/features/calendar/data/repo/visit_repo.dart';

class VisitRepoImplem implements VisitRepo{
  final DbServices dbServices;
  VisitRepoImplem(this.dbServices);

  @override
  Future<Either<Failure, int>> createNewVisit(VisitModel visit)async{
    try{
      int result = await dbServices.insertData('visits', visit.toDb());
      if (result==0) return Left(Failure(errMsg: "Error Happened"));
      return Right(result);
    }catch(e){
      return Left(
        Failure(errMsg: "Error: ${e.toString()}")
      );
    }
  }

  @override
  Future<Either<Failure, int>> editVisit(VisitModel visit)async{
    try{
      int result = await dbServices.updateData(table: 'visits', values: visit.toDb(), where: 'id = ?', whereArgs: [visit.id]);
      if (result>0){
        return Right(result);
      }
      return Left(Failure(errMsg: "Error happened while modifying data"));
    }catch(e){
      return Left(Failure(errMsg: "Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, int>> removeVisit(int visitId)async{
    try{
      int result = await dbServices.deleteData('visits', visitId);
      if (result>0){
        return Right(result);
      }
      return Left(Failure(errMsg: "Error happened while modifying data"));
    }catch(e){
      return Left(Failure(errMsg: "Unexpected error: ${e.toString()}"));
    }
  }



}