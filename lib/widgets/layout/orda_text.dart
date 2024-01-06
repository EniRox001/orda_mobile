// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The Orda Text widget.
class OrdaText extends StatelessWidget {
  /// Creates the Orda Text widget.
  const OrdaText({
    required this.text,
    required this.context,
    this.style,
    this.color,
    this.isBold,
    super.key,
  });

  /// Creates the Orda Text widget with the given [text]
  /// and headlineSmall text style.
  OrdaText.headlineSmall(
    BuildContext context,
    String text, {
    Color? color,
    bool? isBold,
  }) : this(
          context: context,
          text: text,
          style: GoogleFonts.workSans(
            textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: isBold ?? false == true
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: color,
                ),
          ),
        );

  /// Creates the Orda Text widget with the given [text]
  /// and labelLarge text style.
  OrdaText.labelLarge(
    BuildContext context,
    String text, {
    Color? color,
    bool? isBold,
  }) : this(
          context: context,
          text: text,
          style: GoogleFonts.workSans(
            textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: isBold ?? false == true
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: color,
                ),
          ),
        );

  /// Creates the Orda Text widget with the given [text].
  OrdaText.body(BuildContext context, String text, {Color? color, bool? isBold})
      : this(
          context: context,
          text: text,
          style: GoogleFonts.workSans(
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: isBold ?? false == true
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: color,
                ),
          ),
        );

  /// Creates the Orda Text widget with the given [text]
  /// and bodySmall text style.
  OrdaText.bodySmall(
    BuildContext context,
    String text, {
    Color? color,
    bool? isBold,
  }) : this(
          context: context,
          text: text,
          style: GoogleFonts.workSans(
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: isBold ?? false == true
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: color,
                ),
          ),
        );

  /// Creates the build context.
  final BuildContext context;

  /// The text of the widget.
  final String text;

  /// The text style of the widget.
  final TextStyle? style;

  /// The style color of the widget.
  final Color? color;

  /// Boolean value to check if the text is bold.
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
