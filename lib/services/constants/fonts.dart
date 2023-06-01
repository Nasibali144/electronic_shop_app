
import 'package:flutter/material.dart';

import 'colors.dart';

class Fonts {
  Fonts._();

  /// ```static const String roboto = "Roboto";```
  static const String roboto = "Roboto";

  /// textStyle
  static TextStyle navigationItemTextStyle(Color color) {
    return TextStyle(
      fontSize: 12,
      color: color,
    );
  }

  static TextStyle bannerStyle(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: CustomColors.white,
      fontFamily: Fonts.roboto,
    );
  }
}
