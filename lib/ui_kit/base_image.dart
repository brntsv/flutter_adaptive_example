import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_example/ui_kit/colors.dart';
import 'package:shimmer/shimmer.dart';

class BaseImage extends StatelessWidget {
  const BaseImage({
    required this.url,
    this.width,
    this.height,
    BoxFit? boxFit,
    this.scale,
    this.alignment,
    super.key,
  }) : boxFit = boxFit ?? BoxFit.contain;

  final String url;
  final double? width;
  final double? height;
  final BoxFit boxFit;
  final double? scale;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    Widget image = ExtendedImage.network(
      url,
      width: width,
      height: height,
      cacheMaxAge: const Duration(days: 3),
      loadStateChanged: (state) => switch (state.extendedImageLoadState) {
        LoadState.loading => _buildShimmer(),
        LoadState.completed => _buildCompletedWidget(state),
        LoadState.failed => _buildErrorWidget(),
      },
    );

    // Применяем Transform.scale только если задан масштаб
    if (scale != null && scale != 1.0) {
      image = ClipRect(
        child: Transform.scale(
          scale: scale,
          alignment: Alignment.bottomLeft,
          child: image,
        ),
      );
    }

    return image;
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: UIColors.white,
      highlightColor: UIColors.cF4F4F4,
      child: Container(
        color: UIColors.white,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return const Placeholder();
  }

  Widget _buildCompletedWidget(ExtendedImageState state) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: ExtendedRawImage(
        image: state.extendedImageInfo?.image,
        width: width,
        height: height,
        fit: boxFit,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }
}
