import 'package:flutter/material.dart';
import 'package:flutter_adaptive_example/ui_kit/colors.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmer extends StatelessWidget {
  const BaseShimmer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => Shimmer(
        gradient: const LinearGradient(
          colors: [
            UIColors.cF4F4F4,
            UIColors.cF4F4F4,
            UIColors.white,
            UIColors.cF4F4F4,
            UIColors.cF4F4F4,
          ],
          stops: [0, .35, .5, .65, 1],
        ),
        child: child,
      );
}
