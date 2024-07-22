class VisitModel {
  int patientId;
  DateTime visitDate;
  String visitNotes;
  DateTime date;
  VisitModel visit;

  VisitModel({
    required this.patientId,
    required this.visitDate,
    required this.visitNotes,
    required this.date,
    required this.visit,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return VisitModel(
      patientId: json['patientId'],
      visitDate: DateTime.parse(json['is']),
      visitNotes: json['visitNotes'],
      date: DateTime.parse(json['date']),
      visit: VisitModel.fromJson(json['visit']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'is': visitDate.toIso8601String(),
      'visitNotes': visitNotes,
      'date': date.toIso8601String(),
      'visit': visit.toJson(),
    };
  }

  @override
  String toString() {
    return 'VisitModel{patientId: $patientId, visitDate: $visitDate, visitNotes: $visitNotes, date: $date, visit: $visit}';
  }
}
