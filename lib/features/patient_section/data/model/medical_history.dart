class MedicalHistory {
  String medicalConditions;
  String currentMedications;
  String familyMedicalHistory;
  String allergies;

  MedicalHistory({
    required this.medicalConditions,
    required this.currentMedications,
    required this.familyMedicalHistory,
    required this.allergies,
  });

  Map<String, dynamic> toJson() => {
    'medicalConditions': medicalConditions,
    'currentMedications': currentMedications,
    'familyMedicalHistory': familyMedicalHistory,
    'allergies': allergies,
  };

  factory MedicalHistory.fromJson(Map<String, dynamic> json) => MedicalHistory(
    medicalConditions: json['medicalConditions'],
    currentMedications: json['currentMedications'],
    familyMedicalHistory: json['familyMedicalHistory'],
    allergies: json['allergies'],
  );
}
