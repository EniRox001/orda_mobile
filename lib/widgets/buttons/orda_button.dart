import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orda/gen/assets.gen.dart';

/// Main Button foe Orda
class OrdaButton extends StatelessWidget {
  /// creates the Orda Button.
  const OrdaButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconData,
    super.key,
  });

  /// The icon of the button.
  final String? icon;

  /// The iconData of the button.
  final IconData? iconData;

  /// The label of the button.
  final String label;

  /// The onPressed callback of the button.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        minimumSize: Size(double.infinity, 56.0.h),
      ),
      icon: iconData == null
          ? SvgPicture.asset(icon ?? Assets.icons.googleIcon)
          : Icon(iconData),
      onPressed: onPressed,
      label: Text(label),
    );
  }
}
