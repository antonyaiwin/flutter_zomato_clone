import 'package:flutter/material.dart';

import '../../model/restaurant/restaurant_model.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key, required this.item});

  final RestaurantModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(),
        ],
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: Colors.amber[100 * (index % 9 + 1)],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 50),
      ),
    );
  }
}
