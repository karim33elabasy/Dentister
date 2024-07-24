import 'package:dentister/core/utils/db_services.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:dentister/features/patient_section/data/repos/patient_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

class PatientRepoImplem implements PatientRepo{
  final DbServices dbServices;
  PatientRepoImplem(this.dbServices);

  @override
  Future<Either<Failure,int>>addNewPatient(PatientModel patient) async {
    try{
      int result = await dbServices.insertData('patients', patient.toDb());
      if (result==0) return Left(Failure(errMsg: "Error: Record not added to the database"));
      return Right(result);
    }catch(e){
      return Left(Failure(
          errMsg:"Unexpected error: ${e.toString()}")
      );
    }
  }
  @override
  Future<Either<Failure,List<PatientModel>>>getPatients(String? filter)async{
    try{
      var result =
          filter!=null? await dbServices.readData("SELECT * FROM 'patients' WHERE 'name'='$filter' OR 'phone'='$filter' OR 'address'='$filter'")
        : await dbServices.readData("SELECT * FROM patients");
      List<PatientModel> patients = [];
      for(var patient in result){
        patients.add(PatientModel.fromDb(patient));
      }
      if(patients.length==0) return Left(Failure(errMsg: "No patients found !"));
      return Right(patients);
    }catch(e){
      return Left(Failure(errMsg: "Unexpected error: ${e.toString()}"));
    }
  }
  @override
  deletePatient(int patientId) {

  }

  @override
  editPatient(int patientId, PatientModel patient) {

  }

}