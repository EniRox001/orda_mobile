// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

/// The Orda Text widget.
class OrdaText extends StatelessWidget {
  /// Creates the Orda Text widget.
  const OrdaText({
    required this.text,
    required this.context,
    super.key,
    this.style,
  });

  /// Creates the Orda Text widget with the given [text]
  /// and headlineSmall text style.
  OrdaText.headlineSmall(BuildContext context, String text)
      : this(
          context: context,
          text: text,
          style: Theme.of(context).textTheme.headlineSmall,
        );

  /// Creates the Orda Text widget with the given [text]
  /// and labelLarge text style.
  OrdaText.button(BuildContext context, String text)
      : this(
          context: context,
          text: text,
          style: Theme.of(context).textTheme.labelLarge,
        );

  /// Creates the Orda Text widget with the given [text].
  const OrdaText.body(BuildContext context, String text)
      : this(context: context, text: text, style: null);

  /// Creates the Orda Text widget with the given [text]
  /// and bodySmall text style.
  OrdaText.bodySmall(BuildContext context, String text)
      : this(
          context: context,
          text: text,
          style: Theme.of(context).textTheme.bodySmall,
        );

  /// Creates the build context.
  final BuildContext context;

  /// The text of the widget.
  final String text;

  /// The text style of the widget.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
