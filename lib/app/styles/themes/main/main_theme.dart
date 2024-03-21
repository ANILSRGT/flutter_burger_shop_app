import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/styles/app_colors.dart';
import 'package:flutter_burger_shop_app/app/styles/itheme.dart';
import 'package:flutter_burger_shop_app/app/styles/themes/main/main_theme_app_colors.dart';
import 'package:flutter_burger_shop_app/app/styles/themes/main/main_theme_theme_data.dart';

final class MainTheme extends ITheme {
  @override
  ThemeData data(bool isDark) => MainThemeThemeData(isDark).data();

  @override
  AppColors colors(bool isDark) => MainThemeAppColors(isDark);
}
