import 'package:dartz/dartz.dart';
import 'package:dentister/core/failure/failure.dart';

abstract class MainRepo{
  Future<Either<Failure,Map<String,dynamic>>>getDbData();
}