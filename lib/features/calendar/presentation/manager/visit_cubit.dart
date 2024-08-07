import 'package:dentister/features/calendar/data/model/visit_model.dart';
import 'package:dentister/features/calendar/presentation/manager/visit_states.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/visit_repo_implem.dart';

class VisitCubit extends Cubit<VisitStates>{
  final VisitRepoImplem visitRepoImplem;
  VisitCubit(this.visitRepoImplem):super(VisitStatesInitial());

  GlobalKey<FormState> visitFormKey= GlobalKey<FormState>();
  TextEditingController visitId =TextEditingController();
  bool _visitDone = false;
  PatientModel? patient;
  TextEditingController patientId =TextEditingController();
  TextEditingController visitTitle =TextEditingController();
  TextEditingController visitNotes =TextEditingController();
  TextEditingController visitDate =TextEditingController();
  TextEditingController visitTime =TextEditingController();
  DateTime? visitDateDT;
  TimeOfDay? visitTimeDT;

  set visitDone(bool value){
    _visitDone=value;
    emit(VisitStatesInitial());
  }
  bool get visitDone{
    return _visitDone;
  }
  choosePatient(PatientModel patient){
    this.patient=patient;
    emit(VisitStatesInitial());
  }

  loadParameters(VisitModel visit,PatientModel? patient){
    visitDateDT = visit.visitDate;
    visitTimeDT = TimeOfDay(hour: visit.visitDate.hour, minute: visit.visitDate.minute);
    visitId.text=visit.id.toString();
    patientId.text=visit.patientId.toString();
    visitDone=visit.visitDone;
    visitTitle.text=visit.title;
    visitNotes.text=visit.note;
    visitDate.text="${visitDateDT!.day}/${visitDateDT!.month}/${visitDateDT!.year}";
    visitTime.text="${visitTimeDT!.hourOfPeriod}:${visitTimeDT!.minute} ${visitTimeDT!.period.name}";
    this.patient = patient;
  }

  clearParameters(){
    visitDateDT = null;
    visitTimeDT = null;
    visitId.text="";
    patientId.text="";
    visitDone=false;
    visitTitle.text="";
    visitNotes.text="";
    visitDate.text="";
    visitTime.text="";
    patient = null;
  }
  _createVisit(){
    return VisitModel(
      id: visitId.text.isEmpty? null:int.parse(visitId.text),
      name: patient!.name,
      visitDone: visitDone,
      patientId: patient!.id!,
      visitDate: DateTime(visitDateDT!.year, visitDateDT!.month, visitDateDT!.day, visitTimeDT!.hour, visitTimeDT!.minute),
      title: visitTitle.text,
      note: visitNotes.text
    );
  }

  addNewVisit()async{
    emit(VisitStatesLoading());
    var result = await visitRepoImplem.createNewVisit(_createVisit());
    result.fold(
            (error) {emit(VisitStatesFail(error: error.errMsg));},
            (id) {emit(VisitStatesSuccess(id: id,isEditing: false));
        });
    // Clear parameters after successful patient addition
    clearParameters();
  }

  editVisit({VisitModel? visit})async {
    emit(VisitStatesLoading());
    visit ??= _createVisit();
    var result = await visitRepoImplem.editVisit(visit!);
    result.fold(
            (error) {emit(VisitStatesFail(error: error.errMsg));},
            (id) {emit(VisitStatesSuccess(id: id,isEditing: true));
        });
  }

  removeVisit(int visitID)async{
    emit(VisitStatesLoading());
    var result = await visitRepoImplem.removeVisit(visitID);
    result.fold(
            (error) {emit(VisitStatesFail(error: error.errMsg));},
            (id) {emit(VisitStatesSuccess(id: id,isEditing: true));
        });
  }
}