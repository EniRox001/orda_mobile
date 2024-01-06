import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      } else if (e.code == 'invalid-email') {
        return 'This email is invalid';
      } else {
        return 'An error occurred';
      }
    }
    return 'success';
  }

  /// Gets the currently authenticated user.
  Future<User> getUser() async {
    final user = FirebaseAuth.instance.currentUser!;
    return user;
  }

  /// Signs in a user.
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}
