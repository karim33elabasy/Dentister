class FinancialRecords {
  String invoices;
  String paymentHistory;
  String insuranceInformation;

  FinancialRecords({
    required this.invoices,
    required this.paymentHistory,
    required this.insuranceInformation,
  });

  Map<String, dynamic> toJson() => {
    'invoices': invoices,
    'paymentHistory': paymentHistory,
    'insuranceInformation': insuranceInformation,
  };

  factory FinancialRecords.fromJson(Map<String, dynamic> json) => FinancialRecords(
    invoices: json['invoices'],
    paymentHistory: json['paymentHistory'],
    insuranceInformation: json['insuranceInformation'],
  );
}
