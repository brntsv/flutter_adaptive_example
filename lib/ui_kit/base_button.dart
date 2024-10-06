import 'package:flutter/cupertino.dart';
import 'package:flutter_adaptive_example/ui_kit/colors.dart';
import 'package:flutter_adaptive_example/ui_kit/text_styles.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.onTap,
    required this.text,
    this.color = UIColors.transparent,
    this.textColor = UIColors.white,
    this.disabledColor = UIColors.transparent,
    this.textStyle,
    this.height = 54.0,
    super.key,
  });

  final VoidCallback onTap;
  final String text;
  final Color color;
  final Color textColor;
  final Color disabledColor;
  final double height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: UIColors.white, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: color,
        disabledColor: disabledColor,
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: textStyle ?? UIStyles.w400s14(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
