class XFirebaseAuthException implements Exception {

  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes on error code.
  XFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return "The email address is already registered. Please use a different email.";
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return "The password is too weak. Please choose a stronger password.";
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return "Incorrect password. Please check your password and try again.";
      case 'invalid-verification-code':
        return "Invalid verification code. Please enter a valid code.";
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return "Quota exceeded. Please try again later.";
      case 'email-already-exists':
        return 'The email address already exists. Please use a different email.';
      default:
        return 'An unknown error occurred.';
    }
  }
}