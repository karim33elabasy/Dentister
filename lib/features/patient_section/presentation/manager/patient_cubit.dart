import 'package:bloc/bloc.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_states.dart';

class PatientCubit extends Cubit<PatientStates>{
  PatientCubit():super(PatientStateInitial());

  addNewPatient(PatientModel patient){
    emit(PatientStateLoading());
  }

  editPatient(int patientId,PatientModel patient){
    emit(PatientStateLoading());
  }

  deletePatient(int patientId){
    emit(PatientStateLoading());
  }
}