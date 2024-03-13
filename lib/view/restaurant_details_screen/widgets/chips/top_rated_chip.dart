import 'package:flutter/material.dart';

import '../../../../common/widgets/elevated_card.dart';

class TopRatedChip extends StatelessWidget {
  const TopRatedChip({
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
      child: /* const Row(
        children: [ */
          // Icon(
          //   EvaIcons.star,
          //   color: ColorConstants.primaryBlack,
          //   size: 20,
          // ),
          // SizedBox(width: 5),
          const Text('🌟 Top rated'),
      /*   ],
      ), */
    );
  }
}
