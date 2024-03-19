part of "context_extensions.dart";

final class ThemeContextExtensions {
  final BuildContext _context;
  ThemeContextExtensions(this._context);

  ThemeData get themeData => Theme.of(_context);
  TextTheme get textTheme => themeData.textTheme;
  Brightness get brightness => themeData.brightness;
  ColorScheme get colorScheme => themeData.colorScheme;
}
