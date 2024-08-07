import 'package:dentister/features/patient_section/data/model/patient_model.dart';

class VisitModel {
  final int? id;
  final String? name;
  bool visitDone;
  final int patientId;
  final String title;
  final String note;
  final DateTime visitDate;
  final PatientModel? patient;

  VisitModel({
    required this.id,
    required this.name,
    required this.visitDone,
    required this.patientId,
    required this.title,
    required this.note,
    required this.visitDate,
    this.patient
  });

  factory VisitModel.fromDb(Map<String, dynamic> json,{PatientModel? patient}) {
    return VisitModel(
      id: json["id"],
      name: json["name"],
      visitDone: json["visitDone"] == 1,
      patientId: json["patientId"],
      title: json["title"],
      note: json["note"],
      visitDate: DateTime.fromMillisecondsSinceEpoch(json["visitDate"]),
      patient: patient
    );
  }

  Map<String, Object?> toDb() {
    return {
      'id': id,
      'name': name,
      'visitDone': visitDone? 1 : 0,
      'patientId': patientId,
      'title': title,
      'note': note,
      'visitDate': visitDate.millisecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return 'VisitModel{id: $id, patientId: $patientId, title: $title, note: $note, visitDate: $visitDate}';
  }
}
