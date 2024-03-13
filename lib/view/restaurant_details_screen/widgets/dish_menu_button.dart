import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class DishMenuButton extends StatelessWidget {
  const DishMenuButton({
    super.key,
    this.onTap,
    this.closed = true,
  });
  final void Function()? onTap;
  final bool closed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
      onTap: onTap,
      child: Ink(
        width: 85,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorConstants.black26,
          border: closed
              ? null
              : Border.all(color: ColorConstants.primaryWhite, width: 0.25),
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              closed ? Icons.restaurant_rounded : Icons.close,
              color: ColorConstants.primaryWhite,
              size: 20,
            ),
            Text(
              closed ? 'Menu' : 'Close',
              style: const TextStyle(
                color: ColorConstants.primaryWhite,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
