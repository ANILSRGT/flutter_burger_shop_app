import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final Color? textColor;
  const HeaderText(
    this.text, {
    super.key,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.ext.theme.textTheme.headlineLarge?.copyWith(
        color: textColor,
      ),
    );
  }
}
