import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({
    super.key,
    this.child,
    this.width,
    this.height,
    this.elevation = 0.0,
    this.borderRadius,
    this.padding,
  });

  final Widget? child;
  final double? width;
  final double? height;
  final double elevation;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: borderRadius ?? BorderRadius.circular(15),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        height: height,
        padding: padding ?? const EdgeInsets.all(15),
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.primaryWhite,
          borderRadius: borderRadius ?? BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
