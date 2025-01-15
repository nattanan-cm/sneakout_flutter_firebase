// Static parameters

import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension SizeTheme on Size {
  static double xs = 11;
  static double s = 12;
  static double m = 14;
  static double l = 16;
  static double xl = 18;
  static double xxl = 20;
  static double xxxl = 22;
  static double fourXL = 25;
  static double fiveXL = 28;
  static double sixXL = 32;
}

extension SNOScale<T> on BuildContext {
  Size get headerSize => Size(double.maxFinite, heightResponsive(100));
  double get activityHeight => heightResponsive(40);
  double get gapContentHeight => heightResponsive(20);
  Size get bodySize => Size(
      widthDevice,
      contentSize.height -
          (contentPadding.top +
              contentPadding.bottom +
              activityHeight +
              gapContentHeight));

  EdgeInsets get contentPadding => EdgeInsets.only(
        left: widthResponsive(50),
        right: widthResponsive(50),
        top: heightResponsive(20),
        bottom: heightResponsive(50),
      );

  Size get contentSize => Size(
        widthDevice,
        heightDevice - headerSize.height,
      );
}

// Responsive parameters
extension SizeDevice<T> on BuildContext {
  // Size of the device
  double get widthDevice => MediaQuery.of(this).size.width;
  double get heightDevice => MediaQuery.of(this).size.height;

  // Responsive size
  double widthResponsive(double width) =>
      widthDevice * (width / ResponsiveDevice.widthMoblie);
  double heightResponsive(double height) =>
      heightDevice * (height / ResponsiveDevice.heightMoblie);
}

extension ResponsiveDevice on ResponsiveBreakpoints {
  // Breakpoints
  static List<Breakpoint> breakpoints = [
    const Breakpoint(start: minMobile, end: maxMobile, name: MOBILE),
  ];

  static const double minMobile = 0;
  static const double maxMobile = 450;

  static const double widthMoblie = 390;
  static const double heightMoblie = 844;
}
