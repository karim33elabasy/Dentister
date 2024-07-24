class VisitModel {
  final int visitId;
  final int patientId;
  final DateTime visitDate;
  final String? visitNotes;

  const VisitModel({
    required this.visitId,
    required this.patientId,
    required this.visitDate,
    required this.visitNotes,
  });

  factory VisitModel.fromMap(Map<String, dynamic> map) {
    return VisitModel(
      visitId: map['visitId'],
      patientId: map['patientId'],
      visitDate: DateTime.fromMillisecondsSinceEpoch(map['visitDate']),
      visitNotes: map['visitNotes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'visitId': visitId,
      'patientId': patientId,
      'visitDate': visitDate.millisecondsSinceEpoch,
      'visitNotes': visitNotes,
    };
  }

  @override
  String toString() {
    return 'VisitModel{visitId: $visitId, patientId: $patientId, visitDate: $visitDate, visitNotes: $visitNotes}';
  }
}
