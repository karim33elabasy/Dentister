class PatientModel{
  final int id;
  final String name;
  final String birth;
  final String gender;
  final String phone;
  final String? email;
  final String? address;
  final String? medicalCondition;
  final String? currentMedication;
  final String? familyMedicalHistory;
  final String? allergies;
  final String? previousDentalttt;
  final String? dentalConditions;
  final String? previousXrays;
  final String? xrays;
  final String? photographs;
  final String? labTest;

  PatientModel({required this.id, required this.name, required this.birth, required this.gender, required this.phone, required this.email, required this.address, required this.medicalCondition, required this.currentMedication, required this.familyMedicalHistory, required this.allergies, required this.previousDentalttt, required this.dentalConditions, required this.previousXrays, required this.xrays, required this.photographs, required this.labTest});
}