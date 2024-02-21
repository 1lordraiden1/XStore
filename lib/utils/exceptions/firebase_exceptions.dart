import 'package:firebase_auth/firebase_auth.dart';

class XFirebaseException implements Exception {
  XFirebaseException({required this.error});

  final FirebaseException error;

  String get getUserFriendlyMessage {
    final errorCode = error.code;

    if (errorCode.startsWith('invalid-')) {
      return 'The provided input is invalid.';
    } else if (errorCode.startsWith('weak-')) {
      return 'The provided value is too weak.';
    } else if (errorCode.startsWith('user-')) {
      return 'There is an issue with the user account.';
    } else if (errorCode.startsWith('operation-')) {
      return 'The requested operation could not be completed.';
    } else if (errorCode.startsWith('permission-')) {
      return 'You do not have the necessary permissions for this action.';
    } else {
      return 'An unknown error occurred. Please try again later.';
    }
  }
}
