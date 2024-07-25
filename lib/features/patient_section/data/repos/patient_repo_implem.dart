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
  Future<Either<Failure,List<PatientModel>>>getPatients(String filter)async{
    try{
      var result =
          filter.isNotEmpty? await dbServices.readData('patients', "name LIKE  ? OR phone LIKE  ? OR address LIKE  ?", ["%$filter%","%$filter%","%$filter%"])
            : await dbServices.readData("patients",null,null);
      List<PatientModel> patients = [];
      for(var patient in result){
        patients.add(PatientModel.fromDb(patient));
      }
      return Right(patients);
    }catch(e){
      return Left(Failure(errMsg: "Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure,int>>editPatient(int patientId, PatientModel patient)async{
    try{
      int result = await dbServices.updateData(table: 'patients', values: patient.toDb(), where: 'id = ?', whereArgs: [patient.id!]);
      if (result>0){
        return Right(result);
      }
      return Left(Failure(errMsg: "Error happened while modifying data"));
    }catch(e){
      return Left(Failure(errMsg: "Unexpected error: ${e.toString()}"));
    }
  }

  @override
  deletePatient(int patientId) {

  }

}