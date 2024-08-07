import 'package:dartz/dartz.dart';
import 'package:dentister/core/failure/failure.dart';
import 'package:dentister/core/utils/db_services.dart';
import 'package:dentister/features/calendar/data/model/visit_model.dart';
import 'package:dentister/features/home/data/repos/calendar_repo.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';

class CalendarRepoImplem implements CalendarRepo{
  final DbServices dbServices;
  const CalendarRepoImplem(this.dbServices);

  @override
  Future<Either<Failure, List<VisitModel>>> getVisits() async{
    try{
      List<Map<String,dynamic>> data = await dbServices.readData('visits', null, null);
      List<Map<String,dynamic>> patientsResult = await dbServices.readData('visits', null, null);
      List<PatientModel> patients = [];
      List<VisitModel> visits = [];
      for(var patient in patientsResult){
        patients.add(PatientModel.fromDb(patient));
      }
      for(var visit in data){
        visits.add(VisitModel.fromDb(visit,patient: patients.firstWhere((patient)=>patient.id==visit["id"])));
      }
      return Right(visits);
    }catch(e){
      return Left(
        Failure(errMsg: "error while getting visits")
      );
    }
  }

}