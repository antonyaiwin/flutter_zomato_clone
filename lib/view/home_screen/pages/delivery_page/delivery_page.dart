import 'package:flutter/material.dart';

import '../../../../common/widgets/restaurant_card.dart';
import '../../../../common/widgets/spacer.dart';
import '../../../../data/dummy_data/dummy_db.dart';
import '../../../login_screen/widgets/labeled_divider.dart';
import 'widgets/delivery_chips.dart';
import 'widgets/dish_grid_view.dart';
import '../../widgets/slivers/location_sliver_app_bar.dart';
import '../../widgets/slivers/main_chips_sliver_app_bar.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage>
    with AutomaticKeepAliveClientMixin {
  final List<GlobalKey> listItemKeyList = List.generate(
      DummyDb.restaurants.length,
      (index) => GlobalKey(debugLabel: index.toString()));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NestedScrollView(
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
        const MainChipsSliverAppBar(flexibleSpace: DeliveryChips()),
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
