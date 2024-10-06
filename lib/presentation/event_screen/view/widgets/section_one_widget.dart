import 'package:flutter/material.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/one/linear_gradient_dto.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/one/section_one_dto.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/one/subsection_dto.dart';
import 'package:flutter_adaptive_example/ui_kit/base_button.dart';
import 'package:flutter_adaptive_example/ui_kit/base_image.dart';
import 'package:flutter_adaptive_example/ui_kit/colors.dart';
import 'package:flutter_adaptive_example/ui_kit/icons.dart';
import 'package:flutter_adaptive_example/ui_kit/text_styles.dart';
import 'package:flutter_adaptive_example/utils/extensions/color_extension.dart';

class SectionOneWidget extends StatelessWidget {
  const SectionOneWidget({required this.sectionOne, super.key});
  final SectionOneDto sectionOne;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    /// Переменная, отвечающая за адаптив
    final isWider = size.width > size.height;

    final padding = isWider ? 20.0 : 10.0;
    final heightSectionOne = isWider ? 400.0 : 567.0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildBackCircles(context, isWider),
        _buildMainContent(isWider, padding, heightSectionOne),
        ..._buildFrontCircles(context, isWider, padding, heightSectionOne),
      ],
    );
  }

  /// Основное содержимое
  Widget _buildMainContent(bool isWider, double padding, double heightSectionOne) {
    return SizedBox(
      height: heightSectionOne,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: isWider ? _buildWiderLayout() : _buildNarrowerLayout(),
        ),
      ),
    );
  }

  /// Десктоп версия
  Widget _buildWiderLayout() {
    final subsections = sectionOne.subsections;
    const isWider = true;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: _buildSubsectionOne(subsections.first, isWider),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: _buildSubsectionTwo(subsections.last, isWider),
          ),
        ),
      ],
    );
  }

  /// МП версия
  Widget _buildNarrowerLayout() {
    final subsections = sectionOne.subsections;
    const isWider = false;

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: _buildSubsectionOne(subsections.first, isWider),
        ),
        Expanded(
          child: _buildSubsectionTwo(subsections.last, isWider),
        ),
      ],
    );
  }

  ///* Строит первую субсекцию
  Widget _buildSubsectionOne(SubsectionDto subsection, bool isWider) {
    return Stack(
      fit: StackFit.expand,
      children: [
        BaseImage(
          url: subsection.image,
          scale: 1.4,
          boxFit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
        Positioned.fill(
          child: _buildGradientOverlay(subsection.linearGradient, isWider),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: _buildSubsectionOneContent(subsection, isWider),
        ),
      ],
    );
  }

  /// Строит градиентный слой для изображения
  Widget _buildGradientOverlay(LinearGradientDto? gradient, bool isWider) {
    final startColor = (gradient?.start.color ?? '').toColor(
      opacity: gradient?.start.opacity ?? 0,
    );
    final endColor = (gradient?.end.color ?? '').toColor(
      opacity: gradient?.end.opacity ?? 100,
    );
    final stopOne = (gradient?.start.stop ?? 0) / 100;
    final stopTwo = (gradient?.end.stop ?? 100) / 100;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: isWider ? Alignment.topCenter : Alignment.bottomCenter,
          end: isWider ? Alignment.bottomCenter : Alignment.topCenter,
          colors: [startColor, endColor],
          stops: [stopOne, stopTwo],
        ),
      ),
    );
  }

  Widget _buildSubsectionOneContent(SubsectionDto subsection, bool isWider) {
    final firstTitle = subsection.headers.first.title;
    final secondTitle = isWider
        ? subsection.headers.last.title.replaceFirst(' ', '\n')
        : subsection.headers.last.title.replaceAll(' ', '\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(firstTitle, style: isWider ? UIStyles.w400s30() : UIStyles.w400s20()),
        const SizedBox(height: 12),
        if (isWider) ...[const Spacer()],
        if (isWider) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  secondTitle,
                  style: UIStyles.w700s40(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: UIIcons.arrowRight(),
              ),
            ],
          ),
        ] else ...[
          Text(secondTitle, style: UIStyles.w700s30()),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {},
            child: UIIcons.arrowRight(),
          ),
        ],
      ],
    );
  }

  ///* Строит вторую субсекцию
  Widget _buildSubsectionTwo(SubsectionDto subsection, bool isWider) {
    final title = subsection.headers.first;
    final subtitle = subsection.headers.last;
    final description = subtitle.description ?? '';
    final buttonText = subsection.buttonText ?? '';

    return Stack(
      fit: StackFit.expand,
      children: [
        BaseImage(
          url: subsection.image,
          boxFit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title.title, style: isWider ? UIStyles.w400s30() : UIStyles.w400s20()),
              Text(subtitle.title, style: isWider ? UIStyles.w700s30() : UIStyles.w700s20()),
              if (isWider) ...[
                Text(description, style: isWider ? UIStyles.w400s16() : UIStyles.w400s14()),
              ],
              const SizedBox(height: 20),
              BaseButton(text: buttonText, onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }

  /// Круги сверху стэка
  List<Widget> _buildFrontCircles(
    BuildContext context,
    bool isWider,
    double padding,
    double heightSectionOne,
  ) {
    final size = MediaQuery.sizeOf(context);
    const topRightCircleSize = 99.0;
    const leftCircleSize = 76.0;
    const middleRightCircleSize = 36.0;

    final topRightCirclePosition =
        isWider ? -(topRightCircleSize / 2) + padding : -(topRightCircleSize / 2);

    return [
      Positioned(
        top: topRightCirclePosition,
        right: topRightCirclePosition,
        child: Container(
          width: topRightCircleSize,
          height: topRightCircleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: UIColors.cDDE0CD, width: 4),
          ),
        ),
      ),
      Positioned(
        left: isWider ? -(leftCircleSize / 2) + padding : -(leftCircleSize / 2),
        top: heightSectionOne * .4,
        child: Container(
          width: leftCircleSize,
          height: leftCircleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: UIColors.c6C846C,
          ),
        ),
      ),
      if (!isWider) ...[
        Positioned(
          bottom: heightSectionOne * .3 + padding / 2,
          right: size.width * .1,
          child: Container(
            width: middleRightCircleSize,
            height: middleRightCircleSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: UIColors.cBCCCAF,
            ),
          ),
        ),
      ],
    ];
  }

  /// Круги внизу стэка
  Widget _buildBackCircles(BuildContext context, bool isWider) {
    final size = MediaQuery.sizeOf(context);
    const bottomLeftCircleSize = 36.0;
    final bottomPosition = isWider ? bottomLeftCircleSize / 6 : -bottomLeftCircleSize / 6;
    final leftPosition = isWider ? size.width * .5 : size.width * .1;
    final color = isWider ? UIColors.cBCCCAF : UIColors.c183022;

    return Positioned(
      bottom: bottomPosition,
      left: leftPosition,
      child: Container(
        width: bottomLeftCircleSize,
        height: bottomLeftCircleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
