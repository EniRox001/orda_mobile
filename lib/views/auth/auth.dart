import 'dart:io';

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orda/views/auth/widgets/signin.dart';
import 'package:orda/views/auth/widgets/signup.dart';
import 'package:orda/widgets/layout/orda_text.dart';

/// the signup screen.
class Auth extends StatefulWidget {
  /// creates the signup screen.
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  List<Widget> screens = [
    const Signin(),
    const Signup(),
  ];

  /// the current app bar selection.
  Set<String> _currentAppBarSelection = {'sign in'};

  int _currentSelection = 1;

  void _onAppBarSelectionChanged(Set<String> selection) {
    setState(() {
      _currentAppBarSelection = selection;
      _currentSelection = selection.contains('sign in') ? 2 : 1;
    });
  }

  void _onSelectionChanged(int selection) {
    setState(() {
      _currentSelection = selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildAuthAppBar(context: context),
              _buildForm(index: _currentSelection - 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthAppBar({
    required BuildContext context,
    bool showSkip = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Visibility(
            visible: Platform.isIOS,
            replacement: const Icon(Icons.arrow_back),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        Visibility(
          visible: Platform.isIOS,
          replacement: SegmentedButton(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: 'sign up',
                label: OrdaText.bodySmall(context, 'Sign In'),
              ),
              ButtonSegment(
                value: 'sign in',
                label: OrdaText.bodySmall(context, 'Sign Up'),
              ),
            ],
            selected: _currentAppBarSelection,
            onSelectionChanged: _onAppBarSelectionChanged,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 40.sp,
            child: CustomSlidingSegmentedControl(
              height: 40.sp,
              thumbDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(
                  color: Colors.white,
                  width: 1.sp,
                ),
              ),
              padding: 20.sp,
              initialValue: _currentSelection,
              isStretch: true,
              children: {
                1: OrdaText.bodySmall(
                  context,
                  'Sign In',
                  color: _currentSelection == 1 ? Colors.black : Colors.white,
                ),
                2: OrdaText.bodySmall(
                  context,
                  'Sign Up',
                  color: _currentSelection == 2 ? Colors.black : Colors.white,
                ),
              },
              onValueChanged: _onSelectionChanged,
            ),
          ),
        ),
        Visibility(
          visible: showSkip,
          replacement: SizedBox(width: 40.w),
          child: TextButton(
            onPressed: () => context.go('/home'),
            child: OrdaText.bodySmall(context, 'Skip'),
          ),
        ),
      ],
    );
  }

  Widget _buildForm({required int index}) {
    return Expanded(
      child: screens[index],
    );
  }
}
