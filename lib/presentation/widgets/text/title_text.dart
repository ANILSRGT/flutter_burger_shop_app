import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color? textColor;
  const TitleText(
    this.text, {
    super.key,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.ext.theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
