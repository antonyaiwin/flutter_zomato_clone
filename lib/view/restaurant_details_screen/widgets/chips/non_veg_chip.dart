import 'package:flutter/material.dart';

import '../../../../common/widgets/diet_icon.dart';
import '../../../../common/widgets/outlined_card.dart';

class NonVegChip extends StatelessWidget {
  const NonVegChip({
    super.key,
    this.onTap,
    required this.isSelected,
  });
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      onTap: onTap,
      isSelected: isSelected,
      child: const Row(
        children: [
          DietIcon.nonVeg(),
          SizedBox(width: 5),
          Text('Non-veg'),
        ],
      ),
    );
  }
}
