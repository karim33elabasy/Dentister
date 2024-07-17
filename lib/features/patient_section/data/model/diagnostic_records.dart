class DiagnosticRecords {
  String xrays;
  String photographs;
  String labTestResults;

  DiagnosticRecords({
    required this.xrays,
    required this.photographs,
    required this.labTestResults,
  });

  Map<String, dynamic> toJson() => {
    'xrays': xrays,
    'photographs': photographs,
    'labTestResults': labTestResults,
  };

  factory DiagnosticRecords.fromJson(Map<String, dynamic> json) => DiagnosticRecords(
    xrays: json['xrays'],
    photographs: json['photographs'],
    labTestResults: json['labTestResults'],
  );
}
