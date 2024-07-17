class ContactInformation {
  String phoneNumber;
  String emailAddress;
  String physicalAddress;

  ContactInformation({
    required this.phoneNumber,
    required this.emailAddress,
    required this.physicalAddress,
  });

  Map<String, dynamic> toJson() => {
    'phoneNumber': phoneNumber,
    'emailAddress': emailAddress,
    'physicalAddress': physicalAddress,
  };

  factory ContactInformation.fromJson(Map<String, dynamic> json) => ContactInformation(
    phoneNumber: json['phoneNumber'],
    emailAddress: json['emailAddress'],
    physicalAddress: json['physicalAddress'],
  );
}
