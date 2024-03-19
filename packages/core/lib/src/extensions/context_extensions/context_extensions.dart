import 'package:flutter/material.dart';

part "theme_context_extensions.dart";
part "screen_context_extensions.dart";
part "values_context_extensions.dart";
part "padding_context_extensions.dart";
part "radius_context_extensions.dart";
part "duration_context_extensions.dart";

extension ContextExtensions on BuildContext {
  ContextExtensionsExt get ext => ContextExtensionsExt(this);
}

final class ContextExtensionsExt {
  final BuildContext _context;
  ContextExtensionsExt(this._context);

  ScreenContextExtensions get screen => ScreenContextExtensions(_context);
  ThemeContextExtensions get theme => ThemeContextExtensions(_context);
  ValuesContextExtensions get values => ValuesContextExtensions();
  PaddingContextExtensions get padding => PaddingContextExtensions();
  RadiusContextExtensions get radius => RadiusContextExtensions();
  DurationContextExtensions get duration => DurationContextExtensions();
}
