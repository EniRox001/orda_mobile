import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

/// The snackbar content for responses.
void showSnackbar(
  BuildContext context,
  String title,
  String message,
  ContentType contentType,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    ),
  );
}

/// The signup screen.
class Signin extends StatelessWidget {
  /// Creates the signup screen.
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign in'),
      ),
    );
  }
}
