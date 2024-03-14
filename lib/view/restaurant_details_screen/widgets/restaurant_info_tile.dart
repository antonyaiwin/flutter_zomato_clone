import 'package:flutter/material.dart';

import '../../../common/widgets/spacer.dart';

class RestaurantInfoTile extends StatelessWidget {
  const RestaurantInfoTile({
    super.key,
    required this.icon,
    required this.title,
    this.subTitle,
  });

  final IconData icon;
  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          kHSpace(10),
          if (subTitle == null) Text(title),
          if (subTitle != null)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  kVSpace(5),
                  Text(
                    subTitle!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
