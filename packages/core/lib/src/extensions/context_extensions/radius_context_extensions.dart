part of "context_extensions.dart";

final class RadiusContextExtensions {
  RadiusContextExtensions();

  double get radiusSValue => 4.0;
  double get radiusMValue => 8.0;
  double get radiusLValue => 16.0;
  double get radiusXLValue => 20.0;
  double get radiusCircularValue => 100.0;

  Radius get radiusS => Radius.circular(radiusSValue);
  Radius get radiusM => Radius.circular(radiusMValue);
  Radius get radiusL => Radius.circular(radiusLValue);
  Radius get radiusXL => Radius.circular(radiusXLValue);
  Radius get radiusCircular => Radius.circular(radiusCircularValue);

  BorderRadius get borderRadiusS => BorderRadius.circular(radiusSValue);
  BorderRadius get borderRadiusM => BorderRadius.circular(radiusMValue);
  BorderRadius get borderRadiusL => BorderRadius.circular(radiusLValue);
  BorderRadius get borderRadiusXL => BorderRadius.circular(radiusXLValue);
  BorderRadius get borderRadiusCircular =>
      BorderRadius.circular(radiusCircularValue);

  BorderRadius get borderRadiusOnlyTopS =>
      BorderRadius.only(topLeft: radiusS, topRight: radiusS);
  BorderRadius get borderRadiusOnlyTopM =>
      BorderRadius.only(topLeft: radiusM, topRight: radiusM);
  BorderRadius get borderRadiusOnlyTopL =>
      BorderRadius.only(topLeft: radiusL, topRight: radiusL);
  BorderRadius get borderRadiusOnlyTopXL =>
      BorderRadius.only(topLeft: radiusXL, topRight: radiusXL);

  BorderRadius get borderRadiusOnlyBottomS =>
      BorderRadius.only(bottomLeft: radiusS, bottomRight: radiusS);
  BorderRadius get borderRadiusOnlyBottomM =>
      BorderRadius.only(bottomLeft: radiusM, bottomRight: radiusM);
  BorderRadius get borderRadiusOnlyBottomL =>
      BorderRadius.only(bottomLeft: radiusL, bottomRight: radiusL);
  BorderRadius get borderRadiusOnlyBottomXL =>
      BorderRadius.only(bottomLeft: radiusXL, bottomRight: radiusXL);

  BorderRadius get borderRadiusOnlyLeftS =>
      BorderRadius.only(topLeft: radiusS, bottomLeft: radiusS);
  BorderRadius get borderRadiusOnlyLeftM =>
      BorderRadius.only(topLeft: radiusM, bottomLeft: radiusM);
  BorderRadius get borderRadiusOnlyLeftL =>
      BorderRadius.only(topLeft: radiusL, bottomLeft: radiusL);
  BorderRadius get borderRadiusOnlyLeftXL =>
      BorderRadius.only(topLeft: radiusXL, bottomLeft: radiusXL);

  BorderRadius get borderRadiusOnlyRightS =>
      BorderRadius.only(topRight: radiusS, bottomRight: radiusS);
  BorderRadius get borderRadiusOnlyRightM =>
      BorderRadius.only(topRight: radiusM, bottomRight: radiusM);
  BorderRadius get borderRadiusOnlyRightL =>
      BorderRadius.only(topRight: radiusL, bottomRight: radiusL);
  BorderRadius get borderRadiusOnlyRightXL =>
      BorderRadius.only(topRight: radiusXL, bottomRight: radiusXL);

  BorderRadius get borderRadiusOnlyTopLeftS =>
      BorderRadius.only(topLeft: radiusS);
  BorderRadius get borderRadiusOnlyTopLeftM =>
      BorderRadius.only(topLeft: radiusM);
  BorderRadius get borderRadiusOnlyTopLeftL =>
      BorderRadius.only(topLeft: radiusL);
  BorderRadius get borderRadiusOnlyTopLeftXL =>
      BorderRadius.only(topLeft: radiusXL);

  BorderRadius get borderRadiusOnlyTopRightS =>
      BorderRadius.only(topRight: radiusS);
  BorderRadius get borderRadiusOnlyTopRightM =>
      BorderRadius.only(topRight: radiusM);
  BorderRadius get borderRadiusOnlyTopRightL =>
      BorderRadius.only(topRight: radiusL);
  BorderRadius get borderRadiusOnlyTopRightXL =>
      BorderRadius.only(topRight: radiusXL);

  BorderRadius get borderRadiusOnlyBottomLeftS =>
      BorderRadius.only(bottomLeft: radiusS);
  BorderRadius get borderRadiusOnlyBottomLeftM =>
      BorderRadius.only(bottomLeft: radiusM);
  BorderRadius get borderRadiusOnlyBottomLeftL =>
      BorderRadius.only(bottomLeft: radiusL);
  BorderRadius get borderRadiusOnlyBottomLeftXL =>
      BorderRadius.only(bottomLeft: radiusXL);

  BorderRadius get borderRadiusOnlyBottomRightS =>
      BorderRadius.only(bottomRight: radiusS);
  BorderRadius get borderRadiusOnlyBottomRightM =>
      BorderRadius.only(bottomRight: radiusM);
  BorderRadius get borderRadiusOnlyBottomRightL =>
      BorderRadius.only(bottomRight: radiusL);
  BorderRadius get borderRadiusOnlyBottomRightXL =>
      BorderRadius.only(bottomRight: radiusXL);
}
