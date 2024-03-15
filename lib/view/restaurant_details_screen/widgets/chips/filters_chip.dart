import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/outlined_card.dart';
import '../../../../common/widgets/spacer.dart';
import '../../../../utils/constants/colors.dart';

class FiltersChip extends StatelessWidget {
  const FiltersChip({
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
      showCloseIcon: false,
      child: Row(
        children: [
          const Icon(
            EvaIcons.options_2_outline,
            color: ColorConstants.primaryBlack,
            size: 16,
          ),
          kHSpace(2),
          const Text('Filters'),
          const Icon(
            EvaIcons.arrow_down,
            color: ColorConstants.primaryBlack,
            size: 20,
          ),
        ],
      ),
    );
  }
}
