import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQuery;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenWidth = _mediaQuery?.size.width;
    screenHeight = _mediaQuery?.size.height;
  }
}

double getProportionsScreenWidth(double width) {
  double? screenWidth = SizeConfig.screenWidth;
  return (width / 375) * screenWidth!;
}

double getProportionsScreenHeigth(double height) {
  double? screenHeight = SizeConfig.screenHeight;
  return (height / 812.0) * screenHeight!;
}
