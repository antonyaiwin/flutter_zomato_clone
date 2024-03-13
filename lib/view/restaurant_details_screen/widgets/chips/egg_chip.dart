import 'package:flutter/material.dart';

import '../../../../common/widgets/elevated_card.dart';

class EggChip extends StatelessWidget {
  const EggChip({
    super.key,
    this.onTap,
    required this.isSelected,
  });
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      onTap: onTap,
      isSelected: isSelected,
      child: const Row(
        children: [
          // Icon(
          //   Icons.egg_rounded,
          //   size: 20,
          //   color: ColorConstants.ratingBgAmber,
          // ),
          Text('🥚Egg'),
        ],
      ),
    );
  }
}
