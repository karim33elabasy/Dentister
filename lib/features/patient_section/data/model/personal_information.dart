class PersonalInformation {
  String fullName;
  String patientID;
  DateTime dateOfBirth;
  String gender;

  PersonalInformation({
    required this.fullName,
    required this.patientID,
    required this.dateOfBirth,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'patientID': patientID,
    'dateOfBirth': dateOfBirth.toIso8601String(),
    'gender': gender,
  };

  factory PersonalInformation.fromJson(Map<String, dynamic> json) => PersonalInformation(
    fullName: json['fullName'],
    patientID: json['patientID'],
    dateOfBirth: DateTime.parse(json['dateOfBirth']),
    gender: json['gender'],
  );
}
