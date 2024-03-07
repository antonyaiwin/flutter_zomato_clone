import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/view/home_screen/widgets/slivers/location_sliver_app_bar.dart';
import 'package:flutter_zomato_clone/view/login_screen/widgets/labeled_divider.dart';
import 'package:icons_plus/icons_plus.dart';

import 'widgets/dish_grid_view.dart';
import 'widgets/elevated_search_field.dart';
import 'widgets/main_chips.dart';
import 'widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final double elevatedSearchFieldHeight = 55;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorConstants.primaryWhite,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const LocationSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  kVSpace(10),
                  const LabeledDivider(label: 'WHAT\'S ON YOUR MIND?'),
                  kVSpace(20),
                  const DishGridView(),
                  kVSpace(20),
                  const LabeledDivider(label: 'ALL RESTAURANTS'),
                  kVSpace(20),
                ],
              ),
            ),
            const MainChipsSliverAppBar(),
          ],
          body: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              var item = DummyDb.restaurants[index];
              return RestaurantCard(item: item);
            },
            separatorBuilder: (context, index) {
              return kVSpace(20);
            },
            itemCount: DummyDb.restaurants.length,
          ),
        ),
      ),
    );
  }
}
