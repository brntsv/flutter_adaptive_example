import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class UIIcons {
  static const _iconsPath = 'assets/icons';

  static SvgPicture arrowRight({
    Color? color,
    Size? size,
  }) =>
      SvgPicture.asset(
        '$_iconsPath/icon-arrow-right.svg',
        height: size?.height,
        width: size?.width,
      );
}
