import 'package:firebase_auth/firebase_auth.dart';

String checkErrorForSignup(FirebaseAuthException e) {
  switch (e.code) {
    case 'weak-password':
      return 'Password is too weak';

    case 'email-already-in-use':
      return 'This email is already in use';

    case 'invalid-email':
      return 'Invalid email format';

    case 'operation-not-allowed':
      return 'Email/password accounts are not enabled';

    case 'network-request-failed':
      return 'Check your internet connection';

    case 'too-many-requests':
      return 'Too many attempts, try again later';

    case 'invalid-credential':
      return 'Invalid credentials, please try again';

    default:
      return 'Something went wrong';
  }
}

String checkErrorForLogin(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return 'No user found for that email';

    case 'wrong-password':
      return 'Wrong password';

    case 'invalid-email':
      return 'Invalid email format';

    case 'invalid-credential': 
      return 'Email or password is incorrect';

    case 'user-disabled':
      return 'This account has been disabled';

    case 'network-request-failed':
      return 'Check your internet connection';

    default:
      return 'Login failed, please try again';
  }
}
