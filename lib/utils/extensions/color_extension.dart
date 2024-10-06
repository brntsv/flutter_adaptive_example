import 'package:flutter/material.dart';

extension HexColor on String {
  Color toColor({int opacity = 100}) {
    try {
      final color = Color(int.parse('0xFF${replaceFirst('#', '')}'));
      return color.withOpacity(opacity / 100);
    } catch (e) {
      return Colors.transparent;
    }
  }
}
