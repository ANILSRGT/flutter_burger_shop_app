part of "context_extensions.dart";

final class DurationContextExtensions {
  DurationContextExtensions();

  int get durationFastValueMS => 500;
  int get durationNormalValueMS => 1000;
  int get durationSlowValueMS => 2000;
  int get durationVerySlowValueMS => 3000;

  Duration get durationFast => Duration(milliseconds: durationFastValueMS);
  Duration get durationNormal => Duration(milliseconds: durationNormalValueMS);
  Duration get durationSlow => Duration(milliseconds: durationSlowValueMS);
  Duration get durationVerySlow =>
      Duration(milliseconds: durationVerySlowValueMS);
}
