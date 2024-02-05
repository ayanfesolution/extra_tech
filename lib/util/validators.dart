class Validators {
  static String? validatePassword(String? value) {
    // Minimum length of 8 characters
    if (value!.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // At least one capital letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one capital letter';
    }

    // At least one small letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one small letter';
    }

    // At least one number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // At least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null; // Return null if the password is valid
  }

  static String? validateEmail(String value) {
    const Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validateText(String value, String label) {
    if (value.isEmpty || value.length < 3) {
      return '$label is invalid';
    } else {
      return null;
    }
  }

  static String? validateNotEmpty(String value, String label) {
    if (value.isEmpty) {
      return '$label can\'t be empty';
    } else {
      return null;
    }
  }

  static String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'This field is required.';
    } else if (!value.contains(' ') || value.length < 4) {
      return 'Enter a valid full name';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'This field is required.';
    } else if (!(value.length == 11)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

   static String? validateBVN(String value) {
    if (value.length < 11) {
      return 'BVN is invalid';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String value, String password) {
    if (validatePassword(value) != null) {
      return 'Password must be at least  8 characters';
    } else if (value != password) {
      return 'Passwords does not match!';
    } else {
      return null;
    }
  }
}
