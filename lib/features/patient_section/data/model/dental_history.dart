class DentalHistory {
  String previousDentalTreatments;
  String dentalConditions;
  String previousXraysImaging;

  DentalHistory({
    required this.previousDentalTreatments,
    required this.dentalConditions,
    required this.previousXraysImaging,
  });

  Map<String, dynamic> toJson() => {
    'previousDentalTreatments': previousDentalTreatments,
    'dentalConditions': dentalConditions,
    'previousXraysImaging': previousXraysImaging,
  };

  factory DentalHistory.fromJson(Map<String, dynamic> json) => DentalHistory(
    previousDentalTreatments: json['previousDentalTreatments'],
    dentalConditions: json['dentalConditions'],
    previousXraysImaging: json['previousXraysImaging'],
  );
}
