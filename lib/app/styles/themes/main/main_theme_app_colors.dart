import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/styles/app_colors.dart';

class MainThemeAppColors extends AppColors {
  final bool isDark;
  MainThemeAppColors(this.isDark)
      : super(
          primary: ColorOfOn(
            color: const Color(0xFFFF7214),
            onColor: const Color(0xFFFBFBFB),
          ),
          background: ColorOfOn(
            color: isDark ? const Color(0xFF0D0D0D) : const Color(0xFFFBFBFB),
            onColor: isDark ? const Color(0xFFFBFBFB) : const Color(0xFF0D0D0D),
          ),
        );
}
