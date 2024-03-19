part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final EThemes theme;
  final ThemeMode themeMode;
  const ThemeState({
    required this.theme,
    required this.themeMode,
  });

  @override
  List<Object> get props => [];

  ITheme get currentTheme {
    switch (theme) {
      case EThemes.main:
        return MainTheme();
      default:
        return MainTheme();
    }
  }

  ThemeState copyWith({
    EThemes? theme,
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
