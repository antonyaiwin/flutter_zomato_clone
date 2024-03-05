import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../model/restaurant/restaurant_model.dart';
import '../../../utils/constants/colors.dart';
import 'rating_card.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.item,
  });

  final RestaurantModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: ColorConstants.primaryWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: ColorConstants.black3c.withOpacity(0.127),
              blurRadius: 5,
              offset: const Offset(0, 5),
              blurStyle: BlurStyle.normal)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                item.dishes[0].imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  right: 15,
                  top: 15,
                  child: Row(
                    children: [
                      const Icon(
                        Bootstrap.heart,
                        color: ColorConstants.primaryWhite,
                      ),
                      kHSpace(20),
                      const Icon(
                        OctIcons.share_android,
                        color: ColorConstants.primaryWhite,
                      ),
                    ],
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    RatingCard(rating: item.rating),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: item.foodTypes[0],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorConstants.black3c.withOpacity(0.5),
                        ),
                    children: [
                      const TextSpan(
                          text: ' • ',
                          style: TextStyle(color: ColorConstants.primaryBlack)),
                      TextSpan(text: item.foodTypes[1]),
                      const TextSpan(
                          text: ' • ',
                          style: TextStyle(color: ColorConstants.primaryBlack)),
                      TextSpan(text: '₹${Random().nextInt(100) + 150} for one'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      BoxIcons.bx_stopwatch,
                      color: ColorConstants.black3c,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '${Random().nextInt(40) + 10} min',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ColorConstants.black3c.withOpacity(0.5),
                            ),
                        children: [
                          const TextSpan(
                              text: ' • ',
                              style: TextStyle(
                                  color: ColorConstants.primaryBlack)),
                          TextSpan(
                              text:
                                  '${item.distanceInKM.toStringAsFixed(1)} km'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
