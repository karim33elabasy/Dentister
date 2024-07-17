class AppointmentRecords {
  String appointmentDates;
  String visitNotes;
  String treatmentPlans;
  String procedureDetails;

  AppointmentRecords({
    required this.appointmentDates,
    required this.visitNotes,
    required this.treatmentPlans,
    required this.procedureDetails,
  });

  Map<String, dynamic> toJson() => {
    'appointmentDates': appointmentDates,
    'visitNotes': visitNotes,
    'treatmentPlans': treatmentPlans,
    'procedureDetails': procedureDetails,
  };

  factory AppointmentRecords.fromJson(Map<String, dynamic> json) => AppointmentRecords(
    appointmentDates: json['appointmentDates'],
    visitNotes: json['visitNotes'],
    treatmentPlans: json['treatmentPlans'],
    procedureDetails: json['procedureDetails'],
  );
}
