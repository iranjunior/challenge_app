import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const PROTO_HEIGHT = 667.0;
const PROTO_WIDTH = 376.0;

class ResponsiveCalculator {
  static double getHeightResponsive(target) =>
      (target / PROTO_HEIGHT) *
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
  static double getWidthResponsive(target) =>
      (target / PROTO_WIDTH) *
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
}

extension Responsive on num {
  double get responsiveHeight => ResponsiveCalculator.getHeightResponsive(this);
  double get responsiveWidth => ResponsiveCalculator.getHeightResponsive(this);
}
