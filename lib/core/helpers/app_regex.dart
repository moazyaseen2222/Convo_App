class AppRegex {
  // Validate if the email is valid
  static bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  //Validate if the password is valid using a single regex
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&*(),.?":{}|<>])[A-Za-z\d@#$%^&*(),.?":{}|<>]{8,}$',
    ).hasMatch(password);
  }

  // Validate if the password is valid
  // static bool isPasswordValid(String password) {
  //   return hasMinLength(password, 8) &&
  //          hasLowercase(password) &&
  //          hasUppercase(password) &&
  //          hasNumber(password) &&
  //          hasSpecialCharacter(password);
  // }

  // Check for at least one lowercase letter
  // static bool hasLowercase(String input) {
  //   return RegExp(r'[a-z]').hasMatch(input);
  // }

  static bool hasLowercase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  // Check for at least one uppercase letter
  static bool hasUppercase(String input) {
    return RegExp(r'[A-Z]').hasMatch(input);
  }

  // Check for at least one number
  static bool hasNumber(String input) {
    return RegExp(r'[0-9]').hasMatch(input);
  }

  // Check for at least one special character
  static bool hasSpecialCharacter(String input) {
    return RegExp(r'[@#$%^&*(),.?":{}|<>]').hasMatch(input);
  }

  // Check for minimum length using regex
  static bool hasMinLength(String input) {
    return RegExp(r'^.{6,}$').hasMatch(input);
  }

  static bool hasNameMinLength(String input) {
    return RegExp(r'^.{4,}$').hasMatch(input);
  }


  // Check for minimum length
  // static bool hasMinLength(String input, int minLength) {
  //   return input.length >= minLength;
  // }
}
