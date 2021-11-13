import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageFactory {
  static Widget fromAssets(
      {required String asset,
      required double width,
      required double height,
      BoxFit fit = BoxFit.contain}) {
    if (asset.endsWith('svg')) {
      return svg(
        asset,
        height: height,
        width: width,
        fit: fit,
      );
    }
    return Image.asset(
      asset,
      height: height,
      width: width,
      fit: fit,
    );
  }

  static Widget svg(
    String name, {
    required double height,
    required double width,
    fit = BoxFit.contain,
    Color? color,
  }) {
    return SvgPicture.asset(
      name,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
