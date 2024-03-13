import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../common/widgets/spacer.dart';
import '../../../utils/constants/colors.dart';
import '../../../common/widgets/elevated_card.dart';

class MainChips extends StatelessWidget {
  const MainChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedCard(
            child: Row(
              children: [
                const Icon(
                  EvaIcons.options_2_outline,
                  color: ColorConstants.primaryBlack,
                  size: 16,
                ),
                kHSpace(2),
                const Text('Sort'),
                const Icon(
                  EvaIcons.arrow_down,
                  color: ColorConstants.primaryBlack,
                  size: 20,
                ),
              ],
            ),
          ),
          kHSpace(10),
          const ElevatedCard(
            child: Text('Nearest'),
          ),
          kHSpace(10),
          const ElevatedCard(
            child: Text('Rating 4.0+'),
          ),
          kHSpace(10),
          const ElevatedCard(
            child: Text('Pure Veg'),
          ),
          kHSpace(10),
          const ElevatedCard(
            child: Row(
              children: [
                Text('Cuisines'),
                Icon(
                  EvaIcons.arrow_down,
                  color: ColorConstants.primaryBlack,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
