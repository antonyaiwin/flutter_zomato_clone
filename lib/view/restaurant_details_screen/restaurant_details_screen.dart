import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      child: Stack(
        children: [
          Scaffold(
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
                        childrenPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
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
                            DishItemModel dishItem =
                                categoryItem.dishList[index];
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
                  padding: const EdgeInsets.symmetric(vertical: 5)
                      .copyWith(right: 85),
                  child: Row(
                    children: [
                      Expanded(
                        child: TabBar(
                          indicatorPadding:
                              const EdgeInsets.symmetric(vertical: 8),
                          indicatorSize: TabBarIndicatorSize.tab,
                          isScrollable: true,
                          dividerHeight: 0,
                          labelColor: ColorConstants.primaryBlack,
                          unselectedLabelColor:
                              ColorConstants.black3c.withOpacity(0.5),
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          indicator: BoxDecoration(
                              color:
                                  ColorConstants.primaryBlack.withOpacity(0.05),
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
                    ],
                  ),
                ),
              );
            }),
          ),
          const DishMenuPopupWidget(),
        ],
      ),
    );
  }
}

class DishMenuPopupWidget extends StatefulWidget {
  const DishMenuPopupWidget({
    super.key,
  });

  @override
  State<DishMenuPopupWidget> createState() => _DishMenuPopupWidgetState();
}

class _DishMenuPopupWidgetState extends State<DishMenuPopupWidget> {
  bool closed = true;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.deferToChild,
        child: Material(
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedSlide(
                offset: Offset(closed ? 1 : 0, 0),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: Container(
                    margin: const EdgeInsets.only(right: 10, bottom: 30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryWhite,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: DummyDb.recipeCategoryModelList.length,
                        itemBuilder: (context, index) {
                          RecipeCategoryModel item =
                              DummyDb.recipeCategoryModelList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: DefaultTabController.of(context)
                                                  .index ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : null),
                              child: Row(
                                children: [
                                  Expanded(child: Text(item.categoryTitle)),
                                  Text('${item.dishList.length}')
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ),
              DishMenuButton(
                onTap: () {
                  setState(() {
                    closed = !closed;
                  });
                },
                closed: closed,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class DishMenuButton extends StatelessWidget {
  const DishMenuButton({
    super.key,
    this.onTap,
    this.closed = true,
  });
  final void Function()? onTap;
  final bool closed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
      onTap: onTap,
      child: Ink(
        width: 85,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: ColorConstants.black3c,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Icon(
              closed ? Icons.restaurant_rounded : Icons.close,
              color: ColorConstants.primaryWhite,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              closed ? 'Menu' : 'Close',
              style: const TextStyle(
                  color: ColorConstants.primaryWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
