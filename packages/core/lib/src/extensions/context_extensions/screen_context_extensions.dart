part of "context_extensions.dart";

final class ScreenContextExtensions {
  final BuildContext _context;
  ScreenContextExtensions(this._context);

  Size get size => MediaQuery.of(_context).size;
  double get width => size.width;
  double get height => size.height;

  T orientationSize<T>({
    required T portrait,
    required T landscape,
  }) {
    return width > height ? landscape : portrait;
  }

  double get orientationSquareSize {
    return orientationSize(portrait: width, landscape: height);
  }
}
