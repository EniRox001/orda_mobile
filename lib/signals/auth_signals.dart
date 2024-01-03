// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:orda/database/repositories/auth.dart';
// import 'package:signals/signals.dart';

/// Signals for authentication.
// class AuthSignals {
//   final authRepo = AuthRepository();
//
//   /// Signal for the currently authenticated user.
//   final authenticatedUser = signal(User);
//
//   void getAuthenticatedUser() async {
//     final user = await authRepo.getUser();
//     authenticatedUser.value = user;
//   }
//
//   void signup(String email, String password) async {
//     try {
//       final user = await authRepo.signup(email, password);
//       authenticatedUser.value = user;
//     } on FirebaseAuthException catch (e) {
//       authenticatedUser.value = null;
//       print(e);
//     }
//   }
// }
