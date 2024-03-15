import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/elevated_card.dart';

import '../../../common/widgets/spacer.dart';

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
    return ElevatedCard(
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
