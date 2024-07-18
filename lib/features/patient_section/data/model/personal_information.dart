class PersonalInformation {
  final String fullName;
  final String patientID;
  final DateTime dateOfBirth;
  final String gender;
  final bool current;

  const PersonalInformation({
    required this.fullName,
    required this.patientID,
    required this.dateOfBirth,
    required this.gender,
    required this.current
  });

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'patientID': patientID,
    'dateOfBirth': dateOfBirth.toIso8601String(),
    'gender': gender,
    'current': current
  };

  factory PersonalInformation.fromJson(Map<String, dynamic> json) => PersonalInformation(
    fullName: json['fullName'],
    patientID: json['patientID'],
    dateOfBirth: DateTime.parse(json['dateOfBirth']),
    gender: json['gender'],
    current: json['current'],
  );
}
