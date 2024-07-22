class VisitModel {
  int patientId;
  DateTime visitDate;
  String? visitNotes;

  VisitModel({
    required this.patientId,
    required this.visitDate,
    required this.visitNotes,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return VisitModel(
      patientId: json['patientId'],
      visitDate: DateTime.parse(json['visitDate']),
      visitNotes: json['visitNotes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'visitDate': visitDate.toIso8601String(),
      'visitNotes': visitNotes,
    };
  }

  @override
  String toString() {
    return 'VisitModel{patientId: $patientId, visitDate: $visitDate, visitNotes: $visitNotes}';
  }
}
