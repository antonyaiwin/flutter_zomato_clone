// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/common/widgets/time_distance_widget.dart';
import 'package:flutter_zomato_clone/view/home_screen/widgets/rating_card.dart';
import 'package:flutter_zomato_clone/view/home_screen/widgets/slivers/main_chips_sliver_app_bar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../model/restaurant/restaurant_model.dart';
import '../../utils/constants/colors.dart';
import 'widgets/offer_carousel.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key, required this.item});

  final RestaurantModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            expandedHeight: 310,
            actions: innerBoxIsScrolled
                ? null
                : [
                    Icon(
                      Bootstrap.search,
                      size: 20,
                    ),
                    kHSpace(15),
                    Icon(
                      Bootstrap.heart,
                      size: 20,
                    ),
                    kHSpace(15),
                    Icon(
                      MingCute.share_forward_line,
                    ),
                    kHSpace(10),
                    Icon(
                      Icons.more_vert,
                    ),
                    kHSpace(20),
                  ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: DefaultTextStyle(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
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
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: ColorConstants.black26,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    OfferCarousel(),
                  ],
                ),
              ),
              centerTitle: true,
              titlePadding: EdgeInsets.symmetric(vertical: 5),
              expandedTitleScale: 1,
            ),
          ),
          MainChipsSliverAppBar(),
        ],
        body: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.amber[100 * (index % 9 + 1)],
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 50,
        ),
      ),
    );
  }
}
