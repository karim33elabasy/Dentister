import 'package:dentister/features/patient_section/data/model/history_model.dart';

class PatientModel {
  int? id;
  String name;
  String gender;
  DateTime? dateBirth;
  String? phone;
  String? email;
  String? address;
  String? notes;
  HistoryModel history;

  PatientModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.dateBirth,
    required this.phone,
    required this.email,
    required this.address,
    required this.notes,
    required this.history,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      dateBirth: json['dateBirth'] != null ? DateTime.parse(json['dateBirth']) : null,
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      notes: json['notes'],
      history: HistoryModel.fromJson(json['history']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'dateBirth': dateBirth?.toIso8601String(),
      'phone': phone,
      'email': email,
      'address': address,
      'notes': notes,
      'history': history.toJson(),
    };
  }

  @override
  String toString() {
    return 'PatientModel{id: $id, name: $name, gender: $gender, dateBirth: $dateBirth, '
        'phone: $phone, email: $email, address: $address, notes: $notes, history: $history}';
  }
}
