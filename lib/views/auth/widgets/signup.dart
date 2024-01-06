import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orda/contants/enums/auth_states.dart';
import 'package:orda/signals/auth_signals.dart';
import 'package:orda/widgets/orda_notifications.dart';

/// The signup screen.
class Signup extends StatefulWidget {
  /// Creates the signup screen.
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthSignals authSignals = AuthSignals();

  Future<void> _signup() async {
    await authSignals
        .signup(
          _emailController.text,
          _passwordController.text,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            children: [
              const Text('Sign up'),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              ScreenUtil().setVerticalSpacing(20),
              ElevatedButton(
                onPressed: _signup,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign up'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
