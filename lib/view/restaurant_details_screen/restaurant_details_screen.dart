import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';
import 'package:flutter_zomato_clone/model/restaurant/recipe_category_model.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/view/home_screen/widgets/main_chips.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../model/restaurant/restaurant_model.dart';
import 'widgets/dish_tile.dart';
import 'widgets/restaurant_details_header.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key, required this.item});

  final RestaurantModel item;

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  late ScrollController _scrollController;

  double expansionHeaderHeight = 56;
  double containerHeight = 192;
  double dashedLineHeight = 1;
  double dividerHeight = 15;

  BuildContext? tabContext;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double childPosition = 0;
      for (var i = 0; i < DummyDb.recipeCategoryModelList.length; i++) {
        if (offset - 310 + 70 >= childPosition) {
          DefaultTabController.of(tabContext!).animateTo(
            i,
          );
        }
        int num = DummyDb.recipeCategoryModelList[i].dishList.length;
        childPosition += expansionHeaderHeight +
            containerHeight * num +
            dashedLineHeight * (num - 1) +
            dividerHeight;
        // print('iteration $i\n child Position = $childPosition');
      }

      // print('offset : ${_scrollController.offset}');
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToIndex(int index) {
    // print('index = $index\n');
    if (index == 0) {
      animateScrollTo(_scrollController.position.minScrollExtent);
    }
    double childPosition = 0;
    for (var i = 0; i < index; i++) {
      int num = DummyDb.recipeCategoryModelList[i].dishList.length;
      childPosition += expansionHeaderHeight +
          containerHeight * num +
          dashedLineHeight * (num - 1) +
          dividerHeight;
      // print('iteration $i\n child Position = $childPosition');
    }
    childPosition += 310 - 70;
    animateScrollTo(childPosition);
  }

  void animateScrollTo(double offset) {
    _scrollController.animateTo(offset,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: DummyDb.recipeCategoryModelList.length,
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              surfaceTintColor: Colors.transparent,
              pinned: true,
              expandedHeight: 340,
              actions: [
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
                background: RestaurantDetailsHeader(item: widget.item),
                centerTitle: true,
                titlePadding: const EdgeInsets.symmetric(vertical: 5),
                expandedTitleScale: 1,
              ),
              collapsedHeight: kToolbarHeight + 50,
              bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: MainChips(),
                  )),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 500),
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  RecipeCategoryModel categoryItem =
                      DummyDb.recipeCategoryModelList[index];
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
                      categoryItem.categoryTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    initiallyExpanded: true,
                    maintainState: true,
                    children: List.generate(
                      categoryItem.dishList.length,
                      (index) {
                        DishItemModel dishItem = categoryItem.dishList[index];
                        return DishTile(
                          dishItem: dishItem,
                          showDivider:
                              categoryItem.dishList.length - 1 != index,
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemCount: DummyDb.recipeCategoryModelList.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Builder(builder: (context) {
          tabContext = context;
          return Material(
            elevation: 10,
            color: ColorConstants.primaryWhite,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(
                      indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: true,
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                          color: ColorConstants.primaryBlack.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10)),
                      tabs: List.generate(
                        DummyDb.recipeCategoryModelList.length,
                        (index) => Tab(
                          text: DummyDb
                              .recipeCategoryModelList[index].categoryTitle,
                        ),
                      ),
                      onTap: (int index) => scrollToIndex(index),
                    ),
                  ),
                  InkWell(
                    borderRadius:
                        const BorderRadius.horizontal(left: Radius.circular(8)),
                    onTap: () {},
                    child: Ink(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: ColorConstants.black3c,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.restaurant_rounded,
                            color: ColorConstants.primaryWhite,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Menu',
                            style: TextStyle(
                                color: ColorConstants.primaryWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
