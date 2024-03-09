import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../common/widgets/custom_page_indicator.dart';
import '../../../data/dummy_data/dummy_db.dart';

class OfferCarousel extends StatefulWidget {
  const OfferCarousel({super.key});

  @override
  State<OfferCarousel> createState() => _OfferCarouselState();
}

class _OfferCarouselState extends State<OfferCarousel> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 9.5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade50, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: DummyDb.offersMap.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  Map offer = DummyDb.offersMap[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        offer['title'],
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(offer['sub_title']),
                    ],
                  );
                },
                options: CarouselOptions(
                  height: 80,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(milliseconds: 1800),
                  autoPlayAnimationDuration: const Duration(milliseconds: 250),
                  onPageChanged: (index, reason) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                ),
              ),
              CustomPageIndicator(
                  count: DummyDb.offersMap.length, pageIndex: pageIndex),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade700, Colors.blue.shade50],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: SweepGradient(
                  colors: [
                    Colors.blue.shade400,
                    Colors.indigo.shade600,
                  ],
                  tileMode: TileMode.clamp,
                  transform: const GradientRotation(135 * pi / 180),
                  // end: Alignment.centerRight,
                  // begin: Alignment.centerLeft,
                ),
              ),
              child: const Icon(
                FontAwesome.percent_solid,
                size: 15,
                color: ColorConstants.primaryWhite,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade700, Colors.blue.shade50],
                    end: Alignment.centerRight,
                    begin: Alignment.centerLeft,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        )
      ],
    );
  }
}
