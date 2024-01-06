import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orda/contants/enums/auth_states.dart';
import 'package:orda/contants/strings/strings.dart';
import 'package:orda/gen/assets.gen.dart';
import 'package:orda/router/paths.dart';
import 'package:orda/router/routes.dart';
import 'package:orda/signals/auth_signals.dart';
import 'package:orda/utils/gap.dart';
import 'package:orda/widgets/buttons/orda_button.dart';
import 'package:orda/widgets/layout/orda_text.dart';

/// Create the auth instance for the Auth Signals.
final authSignals = AuthSignals();

/// The home auth screen.
class AuthHome extends StatelessWidget {
  /// creates the home auth screen.
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              OrdaText.headlineSmall(context, AppStrings.authHomeTitle),
              Gap.vertical(20),
              OrdaButton.icon(
                iconData: Icons.email_outlined,
                label: AppStrings.emailSignInTitle,
                onPressed: () => context.push(RoutePaths.auth),
                isOutlined: false,
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              Gap.vertical(20),
              OrdaButton.icon(
                iconData: Icons.phone,
                label: AppStrings.phoneSignInTitle,
                onPressed: () {},
              ),
              Gap.vertical(20),
              OrdaButton.icon(
                icon: Assets.icons.googleIcon,
                label: AppStrings.googleSignInTitle,
                onPressed: () async {
                  await _signInWithGoogle();
                },
              ),
              Gap.vertical(20),
              const Divider(),
              Gap.vertical(20),
              OrdaText.bodySmall(context, AppStrings.authHomeFooter),
            ],
          ),
        ),
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
