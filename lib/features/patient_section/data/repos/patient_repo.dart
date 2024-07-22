import 'package:dartz/dartz.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import '../../../../core/failure/failure.dart';

abstract class PatientRepo{
  Future<Either<Failure,int>>addNewPatient(PatientModel patient);
  editPatient(int patientId,PatientModel patient);
  deletePatient(int patientId);
}