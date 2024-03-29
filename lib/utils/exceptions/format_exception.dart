class XFomratException implements Exception {
  XFomratException({this.error = "Format Error"});

  final String error;

  String get handleFormatException {
    // Implement your error handling logic here
    if (error.contains('invalid format')) {
      return 'The provided input is in an invalid format.';
    } else if (error.contains('unexpected character')) {
      return 'The input contains unexpected characters. Please use only allowed formats.';
    } else if (error.contains('missing information')) {
      return 'Some required information is missing. Please fill in all fields.';
    } else {
      // Handle uncategorized errors with a generic message
      return 'An unknown formatting error occurred. Please try again.';
    }
  }
}
