import 'package:flutter/material.dart';

import '../../../../common/widgets/diet_icon.dart';
import '../../../../common/widgets/outlined_card.dart';

class VegChip extends StatelessWidget {
  const VegChip({
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
          DietIcon.veg(),
          SizedBox(width: 5),
          Text('Veg'),
        ],
      ),
    );
  }
}
