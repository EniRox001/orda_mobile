import 'package:firebase_auth/firebase_auth.dart';

/// The authentication CRUD.
class AuthRepository {
  /// Signs in a user.
  Future<String> signup(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'This password is weak';
      } else if (e.code == 'email-already-in-use') {
        return 'This email is already in use';
      }
    }
    return 'success';
  }

  /// Gets the currently authenticated user.
  Future<User> getUser() async {
    final user = FirebaseAuth.instance.currentUser!;
    return user;
  }
}
