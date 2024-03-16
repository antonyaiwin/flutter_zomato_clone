import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/elevated_card.dart';
import '../../../../common/widgets/spacer.dart';
import '../../../../model/restaurant/restaurant_model.dart';
import '../../../../utils/constants/colors.dart';

class DiningDetailsSliverHeader extends StatelessWidget {
  const DiningDetailsSliverHeader({
    super.key,
    required this.item,
  });

  final RestaurantModel item;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverToBoxAdapter(
        child: ElevatedCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorConstants.black3c.withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstants.black3c),
                            ),
                            Text(
                                '${item.foodTypes[0]}, ${item.foodTypes[1]}, ${item.foodTypes[2]}'),
                            kVSpace(2),
                            Text(
                                '${item.place} • ${item.distanceInKM.toStringAsFixed(1)} kms'),
                            kVSpace(2),
                            Text(
                              '₹${item.dishes[0].amount * 2} for two',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 15,
                                    color:
                                        ColorConstants.black3c.withOpacity(0.7),
                                  ),
                            )
                          ],
                        ),
                      ),
                      kHSpace(10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorConstants.black3c.withOpacity(0.3),
                            width: 0.75,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 60,
                              color: ColorConstants.ratingBgGreen,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.rating.toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: ColorConstants.primaryWhite,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: ColorConstants.primaryWhite,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.ratingCount,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorConstants.black3c
                                            .withOpacity(0.7)),
                                  ),
                                  const Text(
                                    'Reviews',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              kVSpace(5),
              Divider(
                color: ColorConstants.black3c.withOpacity(0.15),
                height: 1,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.directions_outlined),
                            kHSpace(5),
                            const Text('Directions')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: ColorConstants.black3c.withOpacity(0.15),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.call_calling_outline,
                              size: 20,
                            ),
                            kHSpace(5),
                            const Text('Call')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
