import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:orda/contants/enums/auth_states.dart';
import 'package:orda/contants/strings/strings.dart';
import 'package:orda/gen/assets.gen.dart';
import 'package:orda/router/routes.dart';
import 'package:orda/signals/auth_signals.dart';
import 'package:orda/utils/gap.dart';
import 'package:orda/widgets/buttons/orda_button.dart';
import 'package:orda/widgets/input/orda_input.dart';
import 'package:orda/widgets/layout/orda_divider.dart';
import 'package:orda/widgets/layout/orda_text.dart';
import 'package:orda/widgets/orda_notifications.dart';

/// Create the auth instance for the Auth Signals.
final authSignals = AuthSignals();

/// The signup screen.
class Signin extends StatefulWidget {
  /// Creates the signup screen.
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = TextEditingController();

  AuthSignals authSignals = AuthSignals();

  Future<void> _signInWithLink() async {
    await authSignals
        .signInWithLink(
          _emailController.text,
        )
        .then(
          (value) => value == AuthStates.success
              ? OrdaNotifications.showSnackbar(
                  context,
                  'Success',
                  'You have successfully signed up',
                  ContentType.success,
                )
              : OrdaNotifications.showSnackbar(
                  context,
                  'Error',
                  'An error occurred',
                  ContentType.warning,
                ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Gap.vertical(20),
          Column(
            children: [
              OrdaButton.icon(
                icon: Assets.icons.googleIcon,
                label: AppStrings.googleSignInTitle,
                onPressed: () async {
                  await _signInWithGoogle();
                },
              ),
              Gap.vertical(20),
              OrdaButton.icon(
                iconData: Icons.phone,
                label: AppStrings.phoneSignInTitle,
                onPressed: () {},
              ),
            ],
          ),
          Gap.vertical(20),
          const OrdaDivider(text: 'or continue with email'),
          Gap.vertical(20),
          const OrdaInput.simple(
            label: 'Email',
            hintText: 'Required',
          ),
          Gap.vertical(5),
          OrdaText.bodySmall(context, 'No password required'),
          Gap.vertical(20),
          OrdaButton.simple(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            label: 'Continue to Sign in',
            onPressed: _signInWithLink,
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    final loggedIn = await authSignals.signInWithGoogle();
    if (loggedIn == AuthStates.success) {
      AppRouter.goToHome();
    }
  }
}
