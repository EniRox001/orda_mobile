import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:orda/contants/enums/auth_states.dart';

/// Logger.
Logger logger = Logger();

/// The authentication CRUD.
class AuthRepository {
  /// setup actionCodeSettings
  final actionCodeSettings = ActionCodeSettings(
    url: 'https://orda-1.web.app',
    handleCodeInApp: true,
    iOSBundleId: 'com.orda.orda',
    androidPackageName: 'com.orda.orda',
    androidInstallApp: true,
    androidMinimumVersion: '16',
  );

  /// Signs in a user.
  Future<AuthStates> signup(String email) async => FirebaseAuth.instance
      .sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      )
      // ignore: inference_failure_on_untyped_parameter
      .catchError((e) => logger.e(e))
      .then(
        (value) => AuthStates.success,
      );

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
