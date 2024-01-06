import 'package:flutter/material.dart';
import 'package:orda/contants/enums/auth_states.dart';
import 'package:orda/contants/strings/strings.dart';
import 'package:orda/gen/assets.gen.dart';
import 'package:orda/router/routes.dart';
import 'package:orda/signals/auth_signals.dart';
import 'package:orda/utils/gap.dart';
import 'package:orda/widgets/buttons/orda_button.dart';

/// Create the auth instance for the Auth Signals.
final authSignals = AuthSignals();

/// The signup screen.
class Signin extends StatelessWidget {
  /// Creates the signup screen.
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Gap.vertical(20),
          Column(
            children: [
              OrdaButton(
                iconData: Icons.phone,
                label: AppStrings.phoneSignInTitle,
                onPressed: () {},
              ),
              Gap.vertical(20),
              OrdaButton(
                icon: Assets.icons.googleIcon,
                label: AppStrings.googleSignInTitle,
                onPressed: () async {
                  await _signInWithGoogle();
                },
              ),
            ],
          ),
          Gap.vertical(20),
          const Divider(),
          Gap.vertical(20),
          const Text(''),
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
