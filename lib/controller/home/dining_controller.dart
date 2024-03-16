import 'dart:math';

import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';

import '../../model/data_model/grid_item_data_model.dart';
import '../../model/restaurant/restaurant_model.dart';

class DiningController {
  late List<GridItemDataModel> gridItemModelList;
  void loadGridItems() {
    gridItemModelList = DummyDb.diningGridItemModelList;
  }

  List<RestaurantModel> getRestaurants() {
    return DummyDb.restaurantsModelList.map((restaurant) {
      return RestaurantModel(
        foodTypes: restaurant.foodTypeIds
            .map((e) => DummyDb.foodTypeModelList
                .firstWhere((element) => element.foodTypeId == e)
                .foodTypeTitle)
            .toList(),
        rating: restaurant.rating,
        ratingCount: restaurant.ratingCount,
        place: restaurant.place,
        distanceInKM: restaurant.distanceInKm,
        dishes: DummyDb.dishesModelList
            .where((element) => restaurant.foodTypeIds
                .any((item) => element.foodTypeIds.contains(item)))
            .toList(),
        name: restaurant.restaurantName,
      );
    }).toList()
      ..shuffle();
  }

  static List<RestaurantModel> getSimilarRestaurants(int count) {
    List<RestaurantModel> mainList = [];
    Set indexes = {};
    while (indexes.length < count) {
      indexes.add(Random().nextInt(DummyDb.restaurantsModelList.length));
    }
    List indexList = indexes.toList();
    for (var i = 0; i < count; i++) {
      var restaurant = DummyDb.restaurantsModelList[indexList[i]];
      mainList.add(
        RestaurantModel(
          foodTypes: restaurant.foodTypeIds
              .map((e) => DummyDb.foodTypeModelList
                  .firstWhere((element) => element.foodTypeId == e)
                  .foodTypeTitle)
              .toList(),
          rating: restaurant.rating,
          ratingCount: restaurant.ratingCount,
          place: restaurant.place,
          distanceInKM: restaurant.distanceInKm,
          dishes: DummyDb.dishesModelList
              .where((element) => restaurant.foodTypeIds
                  .any((item) => element.foodTypeIds.contains(item)))
              .toList()
            ..shuffle(),
          name: restaurant.restaurantName,
        ),
      );
    }
    return mainList..shuffle();
  }
}
