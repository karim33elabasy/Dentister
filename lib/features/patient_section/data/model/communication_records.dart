class CommunicationRecords {
  String messages;
  String appointmentReminders;

  CommunicationRecords({
    required this.messages,
    required this.appointmentReminders,
  });

  Map<String, dynamic> toJson() => {
    'messages': messages,
    'appointmentReminders': appointmentReminders,
  };

  factory CommunicationRecords.fromJson(Map<String, dynamic> json) => CommunicationRecords(
    messages: json['messages'],
    appointmentReminders: json['appointmentReminders'],
  );
}
