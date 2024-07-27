class VisitModel {
  final int? id;
  final int patientId;
  final String title;
  final String note;
  final DateTime visitDate;

  const VisitModel({
    required this.id,
    required this.patientId,
    required this.title,
    required this.note,
    required this.visitDate,
  });

  factory VisitModel.fromDb(Map<String, dynamic> json) {
    return VisitModel(
      id: json["id"],
      patientId: json["patientId"],
      title: json["title"],
      note: json["note"],
      visitDate: DateTime.fromMillisecondsSinceEpoch(json["visitDate"]),
    );
  }

  Map<String, Object?> toDb() {
    return {
      'id': id,
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
