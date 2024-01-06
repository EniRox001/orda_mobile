import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

/// Class for Orda notifications.
class OrdaNotifications {
  /// The snackbar content for responses.
  static void showSnackbar(
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
}
