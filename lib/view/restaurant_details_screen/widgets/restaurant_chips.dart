import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/controller/restaurant/restaurant_details_controller.dart';

import '../../../utils/functions/custom_functions.dart';
import 'dish_filter_bottom_sheet.dart';
import '../../../common/widgets/spacer.dart';
import 'chips/egg_chip.dart';
import 'chips/filters_chip.dart';
import 'chips/non_veg_chip.dart';
import 'chips/top_rated_chip.dart';
import 'chips/veg_chip.dart';

class RestaurantChips extends StatelessWidget {
  const RestaurantChips({
    super.key,
    required this.onChipToggled,
    required this.restaurantDetailsController,
  });
  final void Function() onChipToggled;
  final RestaurantDetailsController restaurantDetailsController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FiltersChip(
            onTap: () {
              showMyModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return DishFilterBottomSheet(
                    controller: scrollController,
                    onChipToggled: onChipToggled,
                    restaurantDetailsController: restaurantDetailsController,
                  );
                },
              );
            },
            isSelected: restaurantDetailsController.dishFilter.filtered,
          ),
          kHSpace(10),
          VegChip(
            isSelected: restaurantDetailsController.dishFilter.veg,
            onTap: () {
              restaurantDetailsController.dishFilter.toggleVeg();
              onChipToggled();
            },
          ),
          kHSpace(10),
          NonVegChip(
            isSelected: restaurantDetailsController.dishFilter.nonVeg,
            onTap: () {
              restaurantDetailsController.dishFilter.toggleNonVeg();
              onChipToggled();
            },
          ),
          kHSpace(10),
          EggChip(
            isSelected: restaurantDetailsController.dishFilter.egg,
            onTap: () {
              restaurantDetailsController.dishFilter.toggleEgg();
              onChipToggled();
            },
          ),
          kHSpace(10),
          TopRatedChip(
            isSelected: restaurantDetailsController.dishFilter.topRated,
            onTap: () {
              restaurantDetailsController.dishFilter.toggleTopRated();
              onChipToggled();
            },
          ),
        ],
      ),
    );
  }
}
