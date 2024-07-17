import 'package:dentister/features/patient_section/data/model/patient_model.dart';

abstract class PatientRepo{
  addNewPatient(PatientModel patient);
  editPatient(int patientId,PatientModel patient);
  deletePatient(int patientId);
}