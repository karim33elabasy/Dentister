class HistoryModel {
  String? dental;
  String? medical;
  String? family;
  String? allergies;
  String? dentalNotes;
  DateTime? lastVisit;
  String? labTest;

  HistoryModel({
    required this.dental,
    required this.medical,
    required this.family,
    required this.allergies,
    required this.dentalNotes,
    required this.lastVisit,
    required this.labTest,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      dental: json['dental'],
      medical: json['medical'],
      family: json['family'],
      allergies: json['allergies'],
      dentalNotes: json['dentalNotes'],
      lastVisit: json['lastVisit'] != null ? DateTime.parse(json['lastVisit']) : null,
      labTest: json['labTest'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dental': dental,
      'medical': medical,
      'family': family,
      'allergies': allergies,
      'dentalNotes': dentalNotes,
      'lastVisit': lastVisit?.toIso8601String(),
      'labTest': labTest,
    };
  }

  @override
  String toString() {
    return 'HistoryModel{dental: $dental, medical: $medical, family: $family, '
        'allergies: $allergies, dentalNotes: $dentalNotes, lastVisit: $lastVisit, labTest: $labTest}';
  }
}
