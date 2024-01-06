import 'package:flutter/material.dart';
import 'package:orda/utils/gap.dart';
import 'package:orda/widgets/layout/orda_text.dart';

/// The Orda Divider widget.
class OrdaDivider extends StatelessWidget {
  /// Creates the Orda Divider widget.
  const OrdaDivider({required this.text, super.key});

  /// Creates the Orda Divider widget with the given [text].
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Gap.horizontal(20),
        OrdaText.body(context, text, color: Colors.black54),
        Gap.horizontal(20),
        const Expanded(child: Divider()),
      ],
    );
  }
}
