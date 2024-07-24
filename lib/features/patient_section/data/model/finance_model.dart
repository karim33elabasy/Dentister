class FinanceModel {
  final int financeId;
  final int patientId;
  final int? visitId;
  final int isIn; // 1 for income, 0 for expense
  final String? visitNotes;
  final DateTime? date; // Store as DateTime, but convert to integer for storage
  final int value;

  const FinanceModel({
    required this.financeId,
    required this.patientId,
    required this.visitId,
    required this.isIn,
    required this.visitNotes,
    required this.date,
    required this.value,
  });

  factory FinanceModel.fromMap(Map<String, dynamic> map) {
    return FinanceModel(
      financeId: map['financeId'],
      patientId: map['patientId'],
      visitId: map['visitId'],
      isIn: map['isIn'],
      visitNotes: map['visitNotes'],
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date']) : null,
      value: map['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'financeId': financeId,
      'patientId': patientId,
      'visitId': visitId,
      'isIn': isIn,
      'visitNotes': visitNotes,
      'date': date?.millisecondsSinceEpoch,
      'value': value,
    };
  }

  @override
  String toString() {
    return 'FinanceModel{financeId: $financeId, patientId: $patientId, visitId: $visitId, isIn: $isIn, visitNotes: $visitNotes, date: $date, value: $value}';
  }
}
