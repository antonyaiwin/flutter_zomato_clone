import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
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
            SliverAppBar(
              primary: false,
              surfaceTintColor: Colors.transparent,
              expandedHeight: kToolbarHeight + elevatedSearchFieldHeight,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                expandedTitleScale: 1,
                background: Padding(
                  padding: EdgeInsets.only(
                    bottom: elevatedSearchFieldHeight,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      const Icon(EvaIcons.pin,
                          color: ColorConstants.primaryColor, size: 29),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Vadakkumbakam',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Eloor, dippo',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorConstants.black3c
                                        .withOpacity(0.6)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Ink(
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryWhite,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstants.black3c.withOpacity(0.5),
                                blurRadius: 2,
                              ),
                            ]),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5),
                          overlayColor: MaterialStatePropertyAll(
                              ColorConstants.primaryColor.withOpacity(0.12)),
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Icon(
                              Bootstrap.translate,
                              size: 18,
                              color: ColorConstants.primaryBlack,
                            ),
                          ),
                        ),
                      ),
                      kHSpace(10),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: ColorConstants.blue.withOpacity(0.5),
                        child: const Text(
                          'E',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                titlePadding: const EdgeInsets.all(0),
                title: const Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedSearchField(),
                ),
              ),
              pinned: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              kVSpace(10),
              const LabeledDivider(label: 'WHAT\'S ON YOUR MIND?'),
              kVSpace(20),
              const DishGridView(),
              kVSpace(20),
              const LabeledDivider(label: 'ALL RESTAURANTS'),
              kVSpace(20),
            ])),
            const SliverAppBar(
              surfaceTintColor: Colors.transparent,
              toolbarHeight: 50,
              flexibleSpace: Center(
                child: PreferredSize(
                    preferredSize: Size.fromHeight(40), child: MainChips()),
              ),
              primary: false,
              pinned: true,
            ),
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
