import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orda/gen/assets.gen.dart';
import 'package:orda/utils/gap.dart';
import 'package:orda/widgets/layout/orda_text.dart';

/// Main Button foe Orda
class OrdaButton extends StatelessWidget {
  /// creates the Orda Button.
  const OrdaButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconData,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.isOutlined = true,
    super.key,
    this.isBold = false,
  });

  /// Creates the Orda Button with the given [label].
  const OrdaButton.simple({
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    bool? isOutlined,
    bool? isBold,
    Key? key,
  }) : this(
          key: key,
          label: label,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          isOutlined: isOutlined,
          isBold: isBold,
        );

  /// Creates the Orda Button with the given [label] and [icon[.
  OrdaButton.icon({
    required String label,
    required VoidCallback onPressed,
    String? icon,
    IconData? iconData,
    Color? backgroundColor,
    Color? foregroundColor = Colors.black,
    bool? isOutlined = true,
    bool? isBold,
    Key? key,
  }) : this(
          key: key,
          label: label,
          onPressed: onPressed,
          icon: icon,
          iconData: iconData,
          backgroundColor: Platform.isAndroid
              ? backgroundColor ?? Colors.white
              : backgroundColor ?? Colors.grey[300],
          foregroundColor: foregroundColor,
          isOutlined: isOutlined,
          isBold: isBold,
        );

  /// The icon of the button.
  final String? icon;

  /// The iconData of the button.
  final IconData? iconData;

  /// The label of the button.
  final String label;

  /// The onPressed callback of the button.
  final VoidCallback onPressed;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The color of the button text.
  final Color? foregroundColor;

  /// Boolean value to check if the button is bordered.
  final bool? isOutlined;

  /// Boolean value to check if the button is bold.
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Platform.isAndroid,
      replacement: CupertinoButton(
        borderRadius: BorderRadius.circular(100.r),
        color: backgroundColor,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: iconData != null,
              child: Icon(
                iconData,
                color: foregroundColor,
              ),
            ),
            Visibility(
              visible: icon != null,
              child: SvgPicture.asset(
                icon ?? Assets.icons.googleIcon,
                height: 20.sp,
                width: 20.sp,
                colorFilter:
                    ColorFilter.mode(foregroundColor!, BlendMode.srcIn),
              ),
            ),
            Gap.horizontal(10),
            OrdaText.body(
              context,
              label,
              color: foregroundColor,
              isBold: isBold,
            ),
          ],
        ),
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: const CircleBorder(),
          side: isOutlined ?? false == true ? const BorderSide() : null,
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          minimumSize: Size(double.infinity, 56.0.h),
        ),
        icon: icon != null
            ? SvgPicture.asset(
                icon ?? Assets.icons.googleIcon,
                colorFilter:
                    ColorFilter.mode(foregroundColor!, BlendMode.srcIn),
              )
            : iconData != null
                ? Icon(
                    iconData,
                    color: foregroundColor,
                  )
                : const SizedBox(),
        onPressed: onPressed,
        label: OrdaText.body(
          context,
          label,
          color: foregroundColor,
          isBold: isBold,
        ),
      ),
    );
  }
}
