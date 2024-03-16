import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/model/restaurant/restaurant_model.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';

import 'widgets/slivers/dining_details_sliver_app_bar.dart';
import 'widgets/slivers/dining_details_sliver_body.dart';
import 'widgets/slivers/dining_details_sliver_header.dart';
import 'widgets/slivers/dining_details_sliver_tab_bar.dart';

class DiningDetailsScreen extends StatelessWidget {
  const DiningDetailsScreen({
    super.key,
    required this.item,
  });
  final RestaurantModel item;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        body: CustomScrollView(
          slivers: [
            const DiningDetailsSliverAppBar(),
            DiningDetailsSliverHeader(item: item),
            const DiningDetailsSliverTabBar(),
            DiningDetailsSliverBody(item: item),
          ],
        ),
      ),
    );
  }
}
