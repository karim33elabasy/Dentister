import 'personal_information.dart';
import 'contact_information.dart';
import 'medical_history.dart';
import 'dental_history.dart';
import 'appointment_records.dart';
import 'diagnostic_records.dart';
import 'financial_records.dart';
import 'communication_records.dart';

class PatientModel {
  PersonalInformation personalInformation;
  ContactInformation contactInformation;
  MedicalHistory medicalHistory;
  DentalHistory dentalHistory;
  AppointmentRecords appointmentRecords;
  DiagnosticRecords diagnosticRecords;
  FinancialRecords financialRecords;
  CommunicationRecords communicationRecords;

  PatientModel({
    required this.personalInformation,
    required this.contactInformation,
    required this.medicalHistory,
    required this.dentalHistory,
    required this.appointmentRecords,
    required this.diagnosticRecords,
    required this.financialRecords,
    required this.communicationRecords,
  });

  Map<String, dynamic> toJson() => {
    'personalInformation': personalInformation.toJson(),
    'contactInformation': contactInformation.toJson(),
    'medicalHistory': medicalHistory.toJson(),
    'dentalHistory': dentalHistory.toJson(),
    'appointmentRecords': appointmentRecords.toJson(),
    'diagnosticRecords': diagnosticRecords.toJson(),
    'financialRecords': financialRecords.toJson(),
    'communicationRecords': communicationRecords.toJson(),
  };

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
    personalInformation: PersonalInformation.fromJson(json['personalInformation']),
    contactInformation: ContactInformation.fromJson(json['contactInformation']),
    medicalHistory: MedicalHistory.fromJson(json['medicalHistory']),
    dentalHistory: DentalHistory.fromJson(json['dentalHistory']),
    appointmentRecords: AppointmentRecords.fromJson(json['appointmentRecords']),
    diagnosticRecords: DiagnosticRecords.fromJson(json['diagnosticRecords']),
    financialRecords: FinancialRecords.fromJson(json['financialRecords']),
    communicationRecords: CommunicationRecords.fromJson(json['communicationRecords']),
  );
}
