import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/colors.dart';
import 'restaurant_info_tile.dart';

class RestaurantInfoBottomSheet extends StatelessWidget {
  const RestaurantInfoBottomSheet({
    super.key,
    required this.restaurantName,
  });
  final String restaurantName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Text(
            restaurantName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.titleMedium!,
          child: IconTheme.merge(
            data: const IconThemeData(color: ColorConstants.primaryBlack),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15)
                  .copyWith(bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstants.primaryWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RestaurantInfoTile(
                      icon: MingCute.fork_spoon_line, title: 'Restaurant Info'),
                  Divider(
                    color: ColorConstants.black3c.withOpacity(0.25),
                    thickness: 0.5,
                    height: 0.5,
                  ),
                  const RestaurantInfoTile(
                      icon: Clarity.eye_hide_line,
                      title: 'Hide this restaurant'),
                  Divider(
                    color: ColorConstants.black3c.withOpacity(0.25),
                    thickness: 0.5,
                    height: 0.5,
                  ),
                  const RestaurantInfoTile(
                    icon: Iconsax.info_circle_outline,
                    title: 'Report fraud or bad practices',
                    subTitle:
                        'Menu items, prices, photos and descriptions are set directly by the restaurant. In case you see any incorrect information, please report it to us.',
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
