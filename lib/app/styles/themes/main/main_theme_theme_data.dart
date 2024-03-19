import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/styles/themes/main/main_theme_app_colors.dart';

class MainThemeThemeData {
  final bool isDark;
  MainThemeThemeData(this.isDark);

  MainThemeAppColors get _colors => MainThemeAppColors(isDark);

  ThemeData get data {
    ThemeData modeData = isDark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);
    return modeData.copyWith(
      brightness: isDark ? Brightness.dark : Brightness.light,
      textTheme: modeData.textTheme.copyWith(),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(
          color: _colors.primary.color,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: _colors.primary.color,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: _colors.primary.color,
            width: 2,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _colors.primary.color,
          foregroundColor: _colors.primary.onColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
