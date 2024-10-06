import 'package:flutter/material.dart';
import 'package:flutter_adaptive_example/ui_kit/colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class UIStyles {
  static TextStyle interFont({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = UIColors.white,
    double? height,
    double? letterSpacing,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
      );

  static TextStyle w700s40({Color color = UIColors.white}) => interFont(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1,
      );

  static TextStyle w700s30({Color color = UIColors.white}) => interFont(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1,
      );

  static TextStyle w700s20({Color color = UIColors.white}) => interFont(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1,
      );

  static TextStyle w700s16({Color color = UIColors.white}) => interFont(
        fontWeight: FontWeight.w700,
        color: color,
        height: 19.36 / 16,
      );

  static TextStyle w400s30({Color color = UIColors.white}) => interFont(
        fontSize: 30,
        color: color,
        height: 36.31 / 30,
      );

  static TextStyle w400s20({Color color = UIColors.white}) => interFont(
        fontSize: 20,
        color: color,
        height: 24.2 / 20,
      );

  static TextStyle w400s16({Color color = UIColors.white}) => interFont(
        color: color,
        height: 23 / 16,
      );

  static TextStyle w400s14({Color color = UIColors.white}) => interFont(
        fontSize: 14,
        color: color,
        height: 16.94 / 14,
        letterSpacing: 0.05,
      );
}
