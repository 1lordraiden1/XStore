import 'package:flutter/services.dart';

class XPlatformException implements Exception {
  XPlatformException({
    required this.error,
  });

  final PlatformException error;

  String get handlePlatformException {
    // Extract the error code and message
    final errorCode = error.code;
    final errorMessage = error.message;

    // Use conditional statements for broad categorization
    if (errorCode.startsWith('PERMISSION_')) {
      return 'You don\'t have the necessary permissions for this action.';
    } else if (errorCode.startsWith('UNAVAILABLE')) {
      return 'The requested resource is unavailable.';
    } else if (errorCode.startsWith('ARGUMENT_ERROR')) {
      return 'An invalid argument was provided.';
    } else if (errorCode.startsWith('UNKNOWN')) {
      return 'An unknown platform error occurred.';
    } else {
      // Use regular expressions for further categorization (optional)
      if (errorMessage != null) {
        // Add your regular expression patterns here, e.g.,
        // if (RegExp(r"camera not found").hasMatch(errorMessage)) {
        //   return "Cannot access camera. Please check permissions.";
        // }
      }
      // Provide a generic message for uncategorized errors
      return 'A platform error occurred. Please try again later.';
    }
  }
}
