import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.color = ColorConstants.primaryColor,
    this.disabledColor = ColorConstants.primaryColorShade10,
    this.onTap,
    this.expanded = true,
    this.padding,
    this.margin,
  }) : outlined = false;

  // Outlined button constructor
  const CustomButton.outlined({
    super.key,
    required this.child,
    this.onTap,
    this.expanded = true,
    this.padding,
    this.margin,
  })  : color = Colors.transparent,
        disabledColor = Colors.transparent,
        outlined = true;

  // Text button constructor
  const CustomButton.text({
    super.key,
    required this.child,
    this.onTap,
    this.expanded = true,
    this.padding,
    this.margin,
  })  : color = Colors.transparent,
        disabledColor = Colors.transparent,
        outlined = false;

  final Widget child;
  final Color color;
  final Color disabledColor;
  final bool expanded;
  final bool outlined;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          width: expanded ? double.infinity : null,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          decoration: BoxDecoration(
              color: onTap == null ? disabledColor : color,
              borderRadius: BorderRadius.circular(10),
              border: outlined
                  ? Border.all(
                      color: ColorConstants.black3c.withOpacity(
                        0.18,
                      ),
                    )
                  : null),
          child: Center(
            child: IconTheme(
              data: IconThemeData(
                color: outlined
                    ? ColorConstants.black26
                    : ColorConstants.primaryWhite,
                size: 16,
              ),
              child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 17,
                    color: outlined
                        ? ColorConstants.black26
                        : ColorConstants.primaryWhite,
                    fontWeight: FontWeight.w600,
                  ),
                  child: child),
            ),
          ),
        ),
      ),
    );
  }
}
