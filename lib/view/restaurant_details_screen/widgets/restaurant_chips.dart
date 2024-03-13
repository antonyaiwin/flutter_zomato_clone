import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/restaurant_details_screen.dart';

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
  });
  final void Function() onChipToggled;
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
                  );
                },
              );
            },
            isSelected: RestaurantDetailsScreen.dishFilter.filtered,
          ),
          kHSpace(10),
          VegChip(
            isSelected: RestaurantDetailsScreen.dishFilter.veg,
            onTap: () {
              RestaurantDetailsScreen.dishFilter.toggleVeg();
              onChipToggled();
            },
          ),
          kHSpace(10),
          NonVegChip(
            isSelected: RestaurantDetailsScreen.dishFilter.nonVeg,
            onTap: () {
              RestaurantDetailsScreen.dishFilter.toggleNonVeg();
              onChipToggled();
            },
          ),
          kHSpace(10),
          EggChip(
            isSelected: RestaurantDetailsScreen.dishFilter.egg,
            onTap: () {
              RestaurantDetailsScreen.dishFilter.toggleEgg();
              onChipToggled();
            },
          ),
          kHSpace(10),
          TopRatedChip(
            isSelected: RestaurantDetailsScreen.dishFilter.topRated,
            onTap: () {
              RestaurantDetailsScreen.dishFilter.toggleTopRated();
              onChipToggled();
            },
          ),
        ],
      ),
    );
  }
}
