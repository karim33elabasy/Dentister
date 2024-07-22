class PatientModel {
  int? id;
  bool currentPatient;
  String name;
  String gender;
  DateTime? dateBirth;  // Stored as epoch time in database
  String? phone;
  String? email;
  String? address;
  String? notes;
  // History parameters
  String? dentalHistory;
  String? medicalHistory;
  String? familyHistory;
  String? allergies;
  String? dentalNotes;
  DateTime? lastVisit;  // Stored as epoch time in database
  String? labTest;

  PatientModel({
    required this.id,
    required this.currentPatient,
    required this.name,
    required this.gender,
    required this.dateBirth,
    required this.phone,
    required this.email,
    required this.address,
    required this.notes,
    required this.dentalHistory,
    required this.medicalHistory,
    required this.familyHistory,
    required this.allergies,
    required this.dentalNotes,
    required this.lastVisit,
    required this.labTest,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      currentPatient: json['currentPatient'],
      name: json['name'],
      gender: json['gender'],
      dateBirth: json['dateBirth'] != null ? DateTime.fromMillisecondsSinceEpoch(json['dateBirth']) : null,
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      notes: json['notes'],
      dentalHistory: json['dentalHistory'],
      medicalHistory: json['medicalHistory'],
      familyHistory: json['familyHistory'],
      allergies: json['allergies'],
      dentalNotes: json['dentalNotes'],
      lastVisit: json['lastVisit'] != null ? DateTime.fromMillisecondsSinceEpoch(json['lastVisit']) : null,
      labTest: json['labTest'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'currentPatient':currentPatient,
      'name': name,
      'gender': gender,
      'dateBirth': dateBirth?.millisecondsSinceEpoch,
      'phone': phone,
      'email': email,
      'address': address,
      'notes': notes,
      'dentalHistory': dentalHistory,
      'medicalHistory': medicalHistory,
      'familyHistory': familyHistory,
      'allergies': allergies,
      'dentalNotes': dentalNotes,
      'lastVisit': lastVisit?.millisecondsSinceEpoch,
      'labTest': labTest,
    };
  }

  @override
  String toString() {
    return 'PatientModel{id: $id, currentPatient: $currentPatient, name: $name, gender: $gender, dateBirth: $dateBirth, '
        'phone: $phone, email: $email, address: $address, notes: $notes, dentalHistory: $dentalHistory, '
        'medicalHistory: $medicalHistory, familyHistory: $familyHistory, allergies: $allergies, '
        'dentalNotes: $dentalNotes, lastVisit: $lastVisit, labTest: $labTest}';
  }
}
