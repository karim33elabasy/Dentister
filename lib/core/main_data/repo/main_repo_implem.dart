import 'package:dartz/dartz.dart';
import 'package:dentister/core/failure/failure.dart';
import 'package:dentister/core/main_data/repo/main_repo.dart';
import 'package:dentister/core/utils/db_services.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import '../../../features/calendar/data/model/visit_model.dart';

class MainRepoImplem implements MainRepo{
  final DbServices dbServices;
  MainRepoImplem(this.dbServices);


  @override
  Future<Either<Failure,Map<String,dynamic>>> getDbData()async{
    try{
      var patientsResult = await dbServices.readData("patients",null,null);
      List<PatientModel> patients = [];
      for(var patient in patientsResult){
        patients.add(PatientModel.fromDb(patient));
      }

      var visitsResult = await dbServices.readData("visits",null,null);

      List<VisitModel> visits = [];
      visits.sort((a, b) => a.visitDate.compareTo(b.visitDate));
      for(var visit in visitsResult){
        visits.add(VisitModel.fromDb(visit));
      }


      return Right(
        {
          'patients': patients,
          'visits': visits,
        }
      );
    }catch(exception){
      return Left(Failure(errMsg: "Getting main data error. ${exception.toString()}"));
    }
  }

}