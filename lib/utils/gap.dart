// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The gap widget.
class Gap extends StatelessWidget {
  /// Creates a gap with the given [size].
  const Gap(this.size, {super.key});

  /// Creates a horizontal gap with the given [size].
  Gap.vertical(double size) : this(size.h);

  /// Creates a vertical gap with the given [size].
  Gap.horizontal(double size) : this(size.w);

  /// The size of the gap.
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size, width: size);
  }
}
