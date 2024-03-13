// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';
import 'package:flutter_zomato_clone/model/restaurant/recipe_category_model.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/widgets/restaurant_chips.dart';

import '../../model/restaurant/restaurant_model.dart';
import 'widgets/dish_menu_button.dart';
import 'widgets/dish_menu_popup_widget.dart';
import 'widgets/dish_tile.dart';
import 'widgets/restaurant_details_header.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key, required this.item});

  final RestaurantModel item;

  static DishFilter dishFilter = DishFilter._();
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
    _scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

// ScrollController Listener
  void scrollListener() {
    double offset = _scrollController.offset;
    double childPosition = 0;
    for (var i = 0; i <= DummyDb.recipeCategoryModelList.length; i++) {
      int num = DummyDb.recipeCategoryModelList[i].dishList.length;
      childPosition += expansionHeaderHeight +
          containerHeight * num +
          dashedLineHeight * (num - 1) +
          dividerHeight;
      if (offset - 310 + 70 < childPosition) {
        DefaultTabController.of(tabContext!).animateTo(
          i,
        );
        break;
      }

      // print('iteration $i\n child Position = $childPosition');
    }

    // print('offset : ${_scrollController.offset}');
  }

  // function to scroll listView to specified offset
  Future<void> scrollToIndex(int index) async {
    // print('index = $index\n');
    _scrollController.removeListener(scrollListener);

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
    await animateScrollTo(childPosition);
    _scrollController.addListener(scrollListener);
  }

  Future<void> animateScrollTo(double offset) async {
    await _scrollController.animateTo(offset,
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
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RestaurantChips(
                      onChipToggled: () {
                        setState(() {});
                      },
                    ),
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
              padding: const EdgeInsets.symmetric(
                  vertical: 5) /* .copyWith(right: 85) */,
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(
                      indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: true,
                      dividerHeight: 0,
                      labelColor: ColorConstants.primaryBlack,
                      unselectedLabelColor:
                          ColorConstants.black3c.withOpacity(0.5),
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
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
                  DishMenuButton(
                    onTap: () async {
                      // setState(() {
                      // closed = !closed;
                      int? returnedIndex = await showDialog(
                        context: tabContext!,
                        builder: (context) {
                          return DishMenuPopupWidget(
                            tabContext: tabContext!,
                          );
                        },
                      );
                      if (returnedIndex != null && context.mounted) {
                        DefaultTabController.of(context)
                            .animateTo(returnedIndex);
                        scrollToIndex(returnedIndex);
                      }
                      // });
                    },
                    closed: true,
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

class DishFilter {
  bool veg = false;
  bool nonVeg = false;
  bool egg = false;
  bool topRated = false;
  DishSortType sortType = DishSortType.unknown;
  DishFilter._();

  bool get filtered => veg || nonVeg || egg || topRated;

  void toggleVeg() {
    veg = !veg;
  }

  void toggleNonVeg() {
    nonVeg = !nonVeg;
  }

  void toggleEgg() {
    egg = !egg;
  }

  void toggleTopRated() {
    topRated = !topRated;
  }

  void clearAll() {
    veg = false;
    nonVeg = false;
    egg = false;
    topRated = false;
    sortType = DishSortType.unknown;
  }
}

enum DishSortType {
  priceLowToHigh(value: 'price_low_to_high'),
  priceHighToLow(value: 'price_high_to_low'),
  ratingHighToLow(value: 'rating_high_to_low'),
  unknown(value: 'unknown');

  final String value;

  const DishSortType({required this.value});
}
