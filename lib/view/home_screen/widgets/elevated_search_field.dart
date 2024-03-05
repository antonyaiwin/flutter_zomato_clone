import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../common/widgets/spacer.dart';
import '../../../utils/constants/colors.dart';

class ElevatedSearchField extends StatelessWidget {
  const ElevatedSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorConstants.primaryWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: ColorConstants.black3c.withOpacity(0.2), blurRadius: 2)
        ],
      ),
      child: Row(
        children: [
          const Icon(EvaIcons.search),
          kHSpace(10),
          Text(
            'Restaurant name or a dish...',
            style: TextStyle(
              color: ColorConstants.black3c.withOpacity(0.8),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 1,
            height: 25,
            color: ColorConstants.black3c.withOpacity(0.5),
          ),
          const Icon(Icons.mic_none)
        ],
      ),
    );
  }
}
