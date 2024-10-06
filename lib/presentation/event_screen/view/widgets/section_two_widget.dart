import 'package:flutter/material.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/two/item_dto.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/two/section_two_dto.dart';
import 'package:flutter_adaptive_example/ui_kit/base_image.dart';
import 'package:flutter_adaptive_example/ui_kit/colors.dart';
import 'package:flutter_adaptive_example/ui_kit/text_styles.dart';
import 'package:flutter_adaptive_example/utils/formatters/price_formatter.dart';

class SectionTwoWidget extends StatelessWidget {
  const SectionTwoWidget({required this.sectionTwo, super.key});
  final SectionTwoDto sectionTwo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isWider = size.width > size.height;
    return Stack(
      children: [
        _buildBackCircle(context),
        _buildMainContent(isWider),
        _buildFrontCircle(context),
      ],
    );
  }

  Widget _buildMainContent(bool isWider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(height: 16),
          _buildItemsList(isWider),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(sectionTwo.title, style: UIStyles.w700s30(color: UIColors.c183022)),
    );
  }

  Widget _buildItemsList(bool isWider) {
    return SizedBox(
      height: isWider ? 278 : 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: sectionTwo.items.length,
        itemBuilder: (context, index) => _buildItemCard(context, sectionTwo.items[index], isWider),
        separatorBuilder: (context, index) => SizedBox(width: isWider ? 24 : 10),
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, ItemDto item, bool isWider) {
    final size = MediaQuery.sizeOf(context);
    const imageSize = 160.0;
    final imageWidth = isWider ? imageSize : size.width * .4;
    return SizedBox(
      width: imageWidth,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: UIColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItemImage(context, item.image, isWider),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildItemDetails(item),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemImage(BuildContext context, String imageUrl, bool isWider) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final imageSize = isWider ? 160.0 : 150.0;
    final imageWidth = isWider ? imageSize : screenWidth * .4;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BaseImage(
        url: imageUrl,
        height: imageSize,
        width: imageWidth,
        boxFit: BoxFit.cover,
      ),
    );
  }

  Widget _buildItemDetails(ItemDto item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.title,
          style: UIStyles.w400s16(color: UIColors.c485F3B),
        ),
        Text(
          PriceFormatter.format(item.price),
          style: UIStyles.w700s16(color: UIColors.c485F3B),
        ),
      ],
    );
  }

  /// Круги внизу стэка
  Widget _buildBackCircle(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const bottomLeftCircleSize = 36.0;

    return Positioned(
      bottom: size.height * .15,
      left: size.width * .2,
      child: Container(
        width: bottomLeftCircleSize,
        height: bottomLeftCircleSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColors.c183022,
        ),
      ),
    );
  }

  /// Круги сверху стэка
  Widget _buildFrontCircle(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const bottomRightCircleSize = 46.0;

    return Positioned(
      bottom: 0,
      right: size.width * .02,
      child: Container(
        width: bottomRightCircleSize,
        height: bottomRightCircleSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColors.cAFB982,
        ),
      ),
    );
  }
}
