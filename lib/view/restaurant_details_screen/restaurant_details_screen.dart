import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';
import 'package:flutter_zomato_clone/view/home_screen/widgets/slivers/main_chips_sliver_app_bar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../model/restaurant/restaurant_model.dart';
import 'widgets/dish_tile.dart';
import 'widgets/restaurant_details_header.dart';

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
                    const Icon(
                      Bootstrap.search,
                      size: 20,
                    ),
                    kHSpace(15),
                    const Icon(
                      Bootstrap.heart,
                      size: 20,
                    ),
                    kHSpace(15),
                    const Icon(
                      MingCute.share_forward_line,
                    ),
                    kHSpace(10),
                    const Icon(
                      Icons.more_vert,
                    ),
                    kHSpace(20),
                  ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: RestaurantDetailsHeader(item: item),
              centerTitle: true,
              titlePadding: const EdgeInsets.symmetric(vertical: 5),
              expandedTitleScale: 1,
            ),
          ),
          const MainChipsSliverAppBar(),
        ],
        body: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            Map catList = DummyDb.expansionCategoryList[index];
            return ExpansionTile(
              childrenPadding: const EdgeInsets.symmetric(horizontal: 12),
              title: Text(catList['category_title']),
              initiallyExpanded: true,
              maintainState: true,
              children: List.generate(
                catList['dish_list'].length,
                (index) {
                  Map dishItem = catList['dish_list'][index];
                  return DishTile(dishItem: dishItem);
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: DummyDb.expansionCategoryList.length,
        ),
      ),
    );
  }
}
