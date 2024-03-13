import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/custom_button.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/widgets/chips/egg_chip.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/widgets/chips/non_veg_chip.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/widgets/chips/top_rated_chip.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/widgets/chips/veg_chip.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/widgets/filter_options_card.dart';

import '../../../common/widgets/elevated_card.dart';
import '../restaurant_details_screen.dart';

class DishFilterBottomSheet extends StatefulWidget {
  const DishFilterBottomSheet({
    super.key,
    required this.controller,
    required this.onChipToggled,
  });

  final ScrollController controller;
  final void Function() onChipToggled;
  @override
  State<DishFilterBottomSheet> createState() => _DishFilterBottomSheetState();
}

class _DishFilterBottomSheetState extends State<DishFilterBottomSheet> {
  late bool veg;
  late bool nonVeg;
  late bool egg;
  late bool topRated;
  late DishSortType sortType;

  @override
  void initState() {
    veg = RestaurantDetailsScreen.dishFilter.veg;
    nonVeg = RestaurantDetailsScreen.dishFilter.nonVeg;
    egg = RestaurantDetailsScreen.dishFilter.egg;
    topRated = RestaurantDetailsScreen.dishFilter.topRated;
    sortType = RestaurantDetailsScreen.dishFilter.sortType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: const BoxDecoration(
            color: ColorConstants.primaryWhite,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          child: Text(
            'Filters and Sorting',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            controller: widget.controller,
            child: Column(
              children: [
                FilterOptionsCard(
                  label: 'Veg/Non-Veg preference',
                  children: [
                    Row(
                      children: [
                        VegChip(
                          isSelected: veg,
                          onTap: () {
                            veg = !veg;

                            setState(() {});
                          },
                        ),
                        kHSpace(20),
                        NonVegChip(
                          isSelected: nonVeg,
                          onTap: () {
                            nonVeg = !nonVeg;

                            setState(() {});
                          },
                        ),
                        kHSpace(20),
                        EggChip(
                          isSelected: egg,
                          onTap: () {
                            egg = !egg;

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                kVSpace(12),
                FilterOptionsCard(
                  label: 'Top picks',
                  children: [
                    TopRatedChip(
                      isSelected: topRated,
                      onTap: () {
                        topRated = !topRated;
                        // widget.onChipToggled();
                        setState(() {});
                      },
                    ),
                  ],
                ),
                kVSpace(12),
                FilterOptionsCard(
                  label: 'Sort by',
                  children: [
                    Wrap(
                      spacing: 20,
                      runSpacing: 15,
                      children: [
                        ElevatedCard(
                          isSelected: sortType == DishSortType.priceLowToHigh,
                          onTap: () {
                            if (sortType == DishSortType.priceLowToHigh) {
                              sortType = DishSortType.unknown;
                            } else {
                              sortType = DishSortType.priceLowToHigh;
                            }

                            setState(() {});
                          },
                          child: const Text('Price - low to high'),
                        ),
                        ElevatedCard(
                          isSelected: sortType == DishSortType.priceHighToLow,
                          onTap: () {
                            if (sortType == DishSortType.priceHighToLow) {
                              sortType = DishSortType.unknown;
                            } else {
                              sortType = DishSortType.priceHighToLow;
                            }
                            setState(() {});
                          },
                          child: const Text('Price - high to low'),
                        ),
                        ElevatedCard(
                          isSelected: sortType == DishSortType.ratingHighToLow,
                          onTap: () {
                            if (sortType == DishSortType.ratingHighToLow) {
                              sortType = DishSortType.unknown;
                            } else {
                              sortType = DishSortType.ratingHighToLow;
                            }
                            setState(() {});
                          },
                          child: const Text('Rating - high to low'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          color: ColorConstants.primaryWhite,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          alignment: Alignment.center,
          height: kToolbarHeight + 15,
          child: Row(
            children: [
              Expanded(
                child: CustomButton.text(
                  padding: EdgeInsets.zero,
                  onTap: () {
                    RestaurantDetailsScreen.dishFilter.clearAll();
                    widget.onChipToggled();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Clear All',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorConstants.primaryColor,
                          fontSize: 19,
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  padding: EdgeInsets.zero,
                  onTap: () {
                    RestaurantDetailsScreen.dishFilter.veg = veg;
                    RestaurantDetailsScreen.dishFilter.nonVeg = nonVeg;
                    RestaurantDetailsScreen.dishFilter.egg = egg;
                    RestaurantDetailsScreen.dishFilter.topRated = topRated;
                    RestaurantDetailsScreen.dishFilter.sortType = sortType;
                    widget.onChipToggled();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Apply',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 19, color: ColorConstants.primaryWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
