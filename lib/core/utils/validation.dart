class Validation{

  /// Validates a non-empty name.
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    if(value.length<3){
      return 'Name is too short';
    }
    return null;
  }

  /// Validates gender which should be either Male or Female.
  static String? validateGender(String? value) {
    if (value == null || (value != "male" && value != "female" || value.isEmpty)) {
      return 'Gender must be Male or Female';
    }
    return null;
  }

  /// Validates birth date in the format dd/MM/yyyy which could be empty.
  static String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Valid if empty
    }
    // Check for a valid date format
    final dateRegExp = RegExp(r'^\d{1,2}/\d{1,2}/\d{4}$');
    if (!dateRegExp.hasMatch(value)) {
      return 'Enter a date in the format dd/MM/yyyy';
    }
    // Further validation to check if the date is logical
    try {
      final parts = value.split('/');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final date = DateTime(year, month, day);

      if (date.year != year || date.month != month || date.day != day) {
        return 'Invalid date';
      }
    } catch (e) {
      return 'Enter a valid date in the format dd/MM/yyyy';
    }
    return null;
  }

  /// Validates a phone number, ensuring it contains only numbers or is empty.
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Valid if empty
    }
    // Check for a valid phone number format (numeric only with optional formatting)
    final phoneRegExp = RegExp(r'^\+?[0-9\s\-\(\)]*$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid phone number without letters';
    }

    // Count numeric digits
    int digitCount = value.replaceAll(RegExp(r'[^0-9]'), '').length;
    if (digitCount < 5) {
      return 'Phone number must is too short';
    }

    return null;
  }

  /// Validates an email which could be empty or valid if not empty.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Valid if empty
    }
    // Check for a valid email format
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}