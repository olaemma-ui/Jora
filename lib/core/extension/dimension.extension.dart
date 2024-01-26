import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// This checks the device screen width to check if the app is
/// runni on mobile phone or not
// bool isAndroid() => GeneralPlatform.isAndroid;

/// This checks the device screen width to check if the app is
/// runni on mobile phone or not
// bool isIOS() => GeneralPlatform.isIOS;

/// This is the application base width
num _baseWIdth = 430;

extension DimensionExtension on num {
  /// This checks the device screen width to check if the app is
  /// runni on mobile phone or not
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= _baseWIdth;

  /// This checks the device screen width to check if the app is
  /// runni on mobile phone or not
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > _baseWIdth;

  /// This method converts the pixeles to em
  double fem(BuildContext context) =>
      this *
      (MediaQuery.of(context).size.width /
          (_baseWIdth.isMobile(context)
              ? _baseWIdth
              : MediaQuery.of(context).size.width));

  /// This method calls the [fem]/0.97 to manage the fonts responsiveness
  double ffem(BuildContext context) => this * (fem(context) / 0.97);
}

extension WidgetExtension on Widget {
  Widget onTap(Function()? onTap) => MaterialButton(
        padding: EdgeInsets.zero,
        height: 0,
        minWidth: 0,
        onPressed: onTap,
        child: this,
      );
}
