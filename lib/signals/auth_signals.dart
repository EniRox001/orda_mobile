import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:orda/contants/enums/auth_states.dart';
import 'package:orda/database/repositories/auth.dart';
import 'package:signals/signals.dart';

// import 'package:signals/signals.dart';
/// Logger.
Logger logger = Logger();

/// Signals for authentication.
class AuthSignals {
  /// Signals for authentication.
  AuthRepository authRepo = AuthRepository();

  /// Authenticated user.
  User? authenticatedUser = FirebaseAuth.instance.currentUser;

  /// Auth state.
  final authState = signal(AuthStates.initial);

  /// Get authenticated user.
  Future<void> getAuthenticatedUser() async {
    final user = await authRepo.getUser();
    authenticatedUser = user;
  }

  /// Sign in.
  Future<AuthStates> signup(
    String email,
    String password,
  ) async {
    try {
      final response = await authRepo.signup(email, password);
      if (response == 'success') {
        logger
          ..i('Signup successful')
          ..i('User: $authenticatedUser');
        authenticatedUser = await authRepo.getUser();
        return AuthStates.success;
      }
    } on FirebaseAuthException catch (e) {
      authenticatedUser = null;
      logger.e(e);
      return AuthStates.error;
    }
    return AuthStates.error;
  }

  /// Sign in with Google.
  Future<AuthStates> signInWithGoogle() async {
    try {
      final response = await authRepo.signInWithGoogle();
      if (response.user != null) {
        logger
          ..i('Signin with Google successful')
          ..i('User: $authenticatedUser');
        authenticatedUser = await authRepo.getUser();
        return AuthStates.success;
      }
    } on FirebaseAuthException catch (e) {
      authenticatedUser = null;
      logger.e(e);
      return AuthStates.error;
    }
    return AuthStates.error;
  }
}
