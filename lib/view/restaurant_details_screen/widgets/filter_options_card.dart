import 'package:flutter/material.dart';

import '../../../common/widgets/spacer.dart';
import '../../../utils/constants/colors.dart';

class FilterOptionsCard extends StatelessWidget {
  const FilterOptionsCard({
    super.key,
    required this.label,
    this.children,
  });

  final String label;
  final List<Widget>? children;
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstants.primaryWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          kVSpace(12),
          if (children != null) ...children!
        ],
      ),
    );
  }
}
