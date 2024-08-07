import 'package:dartz/dartz.dart';
import 'package:dentister/core/failure/failure.dart';
import 'package:dentister/features/calendar/data/model/visit_model.dart';

abstract class CalendarRepo{
  Future<Either<Failure,List<VisitModel>>> getVisits();
}