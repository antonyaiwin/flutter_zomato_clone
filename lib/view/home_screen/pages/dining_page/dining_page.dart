import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/controller/home/dining_controller.dart';
import 'package:flutter_zomato_clone/view/home_screen/pages/dining_page/widgets/dining_grid_view.dart';
import 'package:flutter_zomato_clone/view/home_screen/pages/dining_page/widgets/dining_chips.dart';

import '../../../../common/widgets/restaurant_card.dart';
import '../../../../common/widgets/spacer.dart';
import '../../../../model/restaurant/restaurant_model.dart';
import '../../../login_screen/widgets/labeled_divider.dart';
import '../../widgets/slivers/location_sliver_app_bar.dart';
import '../../widgets/slivers/main_chips_sliver_app_bar.dart';

class DiningPage extends StatefulWidget {
  const DiningPage({super.key});

  @override
  State<DiningPage> createState() => _DiningPageState();
}

class _DiningPageState extends State<DiningPage>
    with AutomaticKeepAliveClientMixin {
  late DiningController controller;

  late final List<GlobalKey> listItemKeyList;

  late List<RestaurantModel> restaurantList;

  @override
  void initState() {
    restaurantList = controller.getRestaurants();
    listItemKeyList = List.generate(restaurantList.length,
        (index) => GlobalKey(debugLabel: index.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const LocationSliverAppBar(),
        const MainChipsSliverAppBar(
          flexibleSpace: DiningChips(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              kVSpace(10),
              const LabeledDivider(label: 'WHAT ARE YOU LOOKING FOR?'),
              kVSpace(20),
              DiningGridView(
                controller: controller,
              ),
              kVSpace(20),
              const LabeledDivider(label: 'ALL RESTAURANTS'),
              kVSpace(20),
            ],
          ),
        ),
      ],
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          var item = restaurantList[index];
          return RestaurantCard.dining(
              itemKey: listItemKeyList[index], item: item);
        },
        separatorBuilder: (context, index) {
          return kVSpace(20);
        },
        itemCount: restaurantList.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
