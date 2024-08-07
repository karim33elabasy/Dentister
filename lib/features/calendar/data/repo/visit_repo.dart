import 'package:dartz/dartz.dart';
import 'package:dentister/core/failure/failure.dart';
import '../model/visit_model.dart';

abstract class VisitRepo{
  Future<Either<Failure,int>> createNewVisit(VisitModel visit);
  Future<Either<Failure,int>>editVisit(VisitModel visit);
  Future<Either<Failure,int>>removeVisit(int visitId);
}