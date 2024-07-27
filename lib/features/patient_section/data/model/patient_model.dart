import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PatientModel {
  final int? id;
  final bool currentPatient;
  final String name;
  final String gender;
  final DateTime? dateBirth;  // Stored as epoch time in database
  final String phone;
  final String email;
  final String address;
  final String notes;
  final Color color;
  // History parameters
  final String dentalHistory;
  final String medicalHistory;
  final String familyHistory;
  final String allergies;
  final String dentalNotes;
  final DateTime? lastVisit;  // Stored as epoch time in database
  final String labTest;

  const PatientModel({
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
    required this.color
  });

  factory PatientModel.fromDb(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      currentPatient: json['currentPatient'] == 1,  // Convert integer to bool
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
      color: Color(int.parse(json['color'], radix: 16))
    );
  }

  Map<String, Object?> toDb() {
    return {
      'id': id,
      'currentPatient': currentPatient ? 1 : 0, // Convert bool to integer
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
      'color': color.toHexString()
    };
  }

  @override
  String toString() {
    return 'PatientModel{id: $id, currentPatient: $currentPatient, name: $name, gender: $gender, dateBirth: $dateBirth, '
        'phone: $phone, email: $email, address: $address, notes: $notes, dentalHistory: $dentalHistory, '
        'medicalHistory: $medicalHistory, familyHistory: $familyHistory, allergies: $allergies, '
        'dentalNotes: $dentalNotes, lastVisit: $lastVisit, labTest: $labTest, color: $color}';
  }
}
