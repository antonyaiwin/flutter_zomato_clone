import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: ColorConstants.primaryWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: ColorConstants.black3c.withOpacity(0.7),
              blurRadius: 0.5,
              blurStyle: BlurStyle.normal)
        ],
      ),
      child: child,
    );
  }
}
