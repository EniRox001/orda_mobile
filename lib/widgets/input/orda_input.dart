import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orda/utils/gap.dart';
import 'package:orda/widgets/layout/orda_text.dart';

/// The Orda Input widget.
class OrdaInput extends StatelessWidget {
  /// Creates the Orda Input widget.
  const OrdaInput({
    required this.label,
    this.controller,
    this.hintText,
    super.key,
  });

  /// Creates the Orda Input widget with the given [label].
  const OrdaInput.simple({
    required String label,
    Key? key,
    TextEditingController? controller,
    String? hintText,
  }) : this(
          key: key,
          label: label,
          controller: controller,
          hintText: hintText,
        );

  /// The controller for the input.
  final TextEditingController? controller;

  /// Creates the Orda Input widget with the given [label].
  final String label;

  /// Created hint text for the input.
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OrdaText.body(
          context,
          label,
          isBold: true,
        ),
        Gap.vertical(10),
        SizedBox(
          height: 56.0.h,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
