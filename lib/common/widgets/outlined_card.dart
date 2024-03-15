import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';

import '../../utils/constants/colors.dart';

class OutlinedCard extends StatelessWidget {
  const OutlinedCard({
    super.key,
    this.child,
    this.onTap,
    this.isSelected = false,
    this.showCloseIcon = true,
  });

  static BorderRadius borderRadius = BorderRadius.circular(8);
  final Widget? child;
  final void Function()? onTap;
  final bool isSelected;
  final bool showCloseIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorConstants.primaryColor.withOpacity(0.04)
              : ColorConstants.primaryWhite,
          borderRadius: borderRadius,
          border: Border.all(
              color: isSelected
                  ? ColorConstants.primaryColor
                  : ColorConstants.black3c.withOpacity(0.2),
              width: 0.5),
          // boxShadow: [
          //   BoxShadow(
          //       color: ColorConstants.black3c.withOpacity(0.7),
          //       blurRadius: 0.5,
          //       blurStyle: BlurStyle.normal)
          // ],
        ),
        child: isSelected && showCloseIcon
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (child != null) child!,
                  kHSpace(5),
                  const Icon(
                    Icons.close_rounded,
                    size: 15,
                    color: ColorConstants.primaryBlack,
                  )
                ],
              )
            : child,
      ),
    );
  }
}
