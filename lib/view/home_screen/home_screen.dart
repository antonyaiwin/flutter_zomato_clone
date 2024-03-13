import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/view/home_screen/widgets/slivers/location_sliver_app_bar.dart';
import 'package:flutter_zomato_clone/view/login_screen/widgets/labeled_divider.dart';

import 'widgets/dish_grid_view.dart';
import '../../common/widgets/restaurant_card.dart';
import 'widgets/slivers/main_chips_sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<GlobalKey> listItemKeyList = List.generate(
      DummyDb.restaurants.length,
      (index) => GlobalKey(debugLabel: index.toString()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            var item = DummyDb.restaurants[index];
            return RestaurantCard(itemKey: listItemKeyList[index], item: item);
          },
          separatorBuilder: (context, index) {
            return kVSpace(20);
          },
          itemCount: DummyDb.restaurants.length,
        ),
      ),
    );
  }
}
