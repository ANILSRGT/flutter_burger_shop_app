part of "string_extensions.dart";

final class ImageStringExtensions {
  ImageStringExtensions();

  String randomImage(int width, int height) =>
      'https://picsum.photos/$width/$height';
}
