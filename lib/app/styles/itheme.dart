import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/styles/app_colors.dart';

abstract class ITheme {
  ThemeData data(bool isDark);
  AppColors colors(bool isDark);
}

extension ThemeExtension on ITheme {
  bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  AppColors appColorsFromMode(BuildContext context) {
    return colors(isDark(context));
  }
}
