import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/spacer.dart';
import '../../../../utils/constants/colors.dart';

class DiningDetailsSliverAppBar extends StatelessWidget {
  const DiningDetailsSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: ColorConstants.primaryWhite,
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      foregroundColor: ColorConstants.primaryBlack,
      pinned: true,
      actions: [
        const CircleAvatar(
          backgroundColor: ColorConstants.primaryWhite,
          foregroundColor: ColorConstants.primaryBlack,
          child: Icon(Clarity.heart_line),
        ),
        kHSpace(10),
        const CircleAvatar(
          backgroundColor: ColorConstants.primaryWhite,
          foregroundColor: ColorConstants.primaryBlack,
          child: Icon(MingCute.share_forward_line),
        ),
        kHSpace(10),
      ],
    );
  }
}
