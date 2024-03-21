import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_burger_shop_app/app/styles/app_colors.dart';
import 'package:flutter_burger_shop_app/app/styles/itheme.dart';
import 'package:flutter_burger_shop_app/presentation/blocs/theme/theme_cubit.dart';

extension ThemeContextExtensions on BuildContext {
  AppColors colors() =>
      watch<ThemeCubit>().state.currentTheme.appColorsFromMode(this);
}
