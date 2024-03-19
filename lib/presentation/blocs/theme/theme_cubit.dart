import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/styles/itheme.dart';
import 'package:flutter_burger_shop_app/app/styles/themes/main/main_theme.dart';
import 'package:flutter_burger_shop_app/presentation/blocs/theme/ethemes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(const ThemeState(
          theme: EThemes.main,
          themeMode: ThemeMode.system,
        ));

  void changeTheme(EThemes theme) {
    emit(state.copyWith(theme: theme));
  }

  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
