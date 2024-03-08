import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/common/widgets/time_distance_widget.dart';
import 'package:flutter_zomato_clone/view/home_screen/widgets/rating_card.dart';

import '../../../model/restaurant/restaurant_model.dart';
import '../../../utils/constants/colors.dart';
import 'offer_carousel.dart';

class RestaurantDetailsHeader extends StatelessWidget {
  const RestaurantDetailsHeader({
    super.key,
    required this.item,
  });

  final RestaurantModel item;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: ColorConstants.black3c,
            fontWeight: FontWeight.w300,
          ),
      child: Column(
        children: [
          kVSpace(
            kToolbarHeight + MediaQuery.of(context).viewPadding.top,
          ),
          Text(
            item.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text.rich(
            TextSpan(
              text: item.foodTypes[0],
              style: TextStyle(
                fontWeight: FontWeight.w100,
                color: ColorConstants.black3c.withOpacity(0.5),
              ),
              children: [
                const TextSpan(text: ' • '),
                TextSpan(text: item.foodTypes[1]),
                const TextSpan(text: ' • '),
                TextSpan(text: item.foodTypes[2]),
              ],
            ),
          ),
          kVSpace(10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingCard(rating: item.rating),
              kHSpace(5),
              Text('${item.ratingCount} ratings'),
            ],
          ),
          kVSpace(10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: ColorConstants.primaryBlack.withOpacity(0.031),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TimeDistanceWidget(
                  timeInMinutes: '${Random().nextInt(40) + 10} min',
                  distanceInKm: item.distanceInKM,
                  foregroundColor: ColorConstants.black3c,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 1,
                  height: 13,
                  color: ColorConstants.black3c.withOpacity(0.25),
                ),
                Text(item.place),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: ColorConstants.black26,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const OfferCarousel(),
        ],
      ),
    );
  }
}
