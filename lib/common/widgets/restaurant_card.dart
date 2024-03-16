import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/restaurant_details_screen.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'time_distance_widget.dart';
import '../../model/restaurant/restaurant_model.dart';
import '../../utils/constants/colors.dart';
import '../../view/home_screen/widgets/rating_card.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({
    super.key,
    required this.itemKey,
    required this.item,
  }) : dining = false;
  const RestaurantCard.dining({
    super.key,
    required this.itemKey,
    required this.item,
  }) : dining = true;

  final RestaurantModel item;
  final Key itemKey;
  final bool dining;
  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool autoPlay = false;
  int currentCarouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailsScreen(
              item: widget.item,
            ),
          ),
        );
      },
      child: VisibilityDetector(
        key: widget.itemKey,
        onVisibilityChanged: (VisibilityInfo visibilityInfo) {
          if (!context.mounted) {
            return;
          }
          var visiblePercentage = visibilityInfo.visibleFraction * 100;

          if (autoPlay && visibilityInfo.visibleFraction < 1) {
            debugPrint('Widget ${widget.item.name} is autoplay paused');
            setState(() {
              autoPlay = false;
            });
          } else if (!autoPlay && visibilityInfo.visibleFraction == 1) {
            debugPrint('Widget ${widget.item.name} is autoplay resumed');
            setState(() {
              autoPlay = true;
            });
          }
          debugPrint(
              'Widget ${widget.item.name} is $visiblePercentage% visible');
        },
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorConstants.black3c.withOpacity(0.5),
              ),
          child: Container(
            clipBehavior: Clip.antiAlias,
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
                    CarouselSlider.builder(
                      itemCount: widget.item.dishes.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return Image.network(
                          widget.item.dishes[itemIndex].imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: autoPlay,
                        viewportFraction: 1,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 150),
                        autoPlayInterval: const Duration(milliseconds: 2500),
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentCarouselIndex = index;
                          });
                        },
                      ),
                    ),
                    if (!widget.dining) ...[
                      Positioned(
                        right: 120,
                        left: 15,
                        top: 15,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              color:
                                  ColorConstants.primaryBlack.withOpacity(0.59),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: ColorConstants.primaryBlack,
                                  width: 0.5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.item.dishes[currentCarouselIndex]
                                        .dishName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: ColorConstants.primaryWhite,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' • ₹${widget.item.dishes[currentCarouselIndex].amount.toStringAsFixed(0)}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: ColorConstants.primaryWhite,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                    ]
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: widget.dining
                      ? const EdgeInsets.all(8).copyWith(top: 0)
                      : null,
                  decoration: widget.dining
                      ? BoxDecoration(
                          color: ColorConstants.primaryWhite,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 30,
                              spreadRadius: 30,
                              color: ColorConstants.primaryBlack,
                            ),
                          ],
                        )
                      : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.item.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Spacer(),
                          RatingCard(rating: widget.item.rating),
                        ],
                      ),
                      kVSpace(8),
                      if (widget.dining)
                        Row(
                          children: [
                            Expanded(
                              child: Text(widget.item.place),
                            ),
                            Text(
                                '${widget.item.distanceInKM.toStringAsFixed(1)} km')
                          ],
                        ),
                      buildSubTitleLower(
                        child: Text.rich(
                          TextSpan(
                            text: widget.item.foodTypes[0],
                            children: [
                              const TextSpan(
                                  text: ' • ',
                                  style: TextStyle(
                                      color: ColorConstants.primaryBlack)),
                              TextSpan(text: widget.item.foodTypes[1]),
                              if (!widget.dining) ...[
                                const TextSpan(
                                    text: ' • ',
                                    style: TextStyle(
                                        color: ColorConstants.primaryBlack)),
                                TextSpan(
                                    text:
                                        '₹${widget.item.dishes[0].amount.toStringAsFixed(0)} for one'),
                              ]
                            ],
                          ),
                        ),
                      ),
                      if (!widget.dining)
                        TimeDistanceWidget(
                          timeInMinutes:
                              '${(60 * widget.item.distanceInKM) / 15} min',
                          distanceInKm: widget.item.distanceInKM,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubTitleLower({required Widget child}) {
    if (widget.dining) {
      return Row(
        children: [
          Expanded(child: child),
          Text(
            '₹${widget.item.dishes[0].amount.toStringAsFixed(0) * 2} for two',
          ),
        ],
      );
    }
    return child;
  }
}
