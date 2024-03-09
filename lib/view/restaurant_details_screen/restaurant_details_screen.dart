import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
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
            surfaceTintColor: Colors.transparent,
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
        body: Container(
          color: Colors.grey.shade100,
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 2, bottom: 100),
            itemBuilder: (context, index) {
              Map catList = DummyDb.expansionCategoryList[index];
              return ExpansionTile(
                iconColor: ColorConstants.primaryBlack,
                backgroundColor: ColorConstants.primaryWhite,
                collapsedBackgroundColor: ColorConstants.primaryWhite,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 12),
                title: Text(
                  catList['category_title'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18),
                ),
                initiallyExpanded: true,
                maintainState: true,
                children: List.generate(
                  catList['dish_list'].length,
                  (index) {
                    Map dishItem = catList['dish_list'][index];
                    return DishTile(
                      dishItem: dishItem,
                      showDivider: catList['dish_list'].length - 1 != index,
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemCount: DummyDb.expansionCategoryList.length,
          ),
        ),
      ),
    );
  }
}
