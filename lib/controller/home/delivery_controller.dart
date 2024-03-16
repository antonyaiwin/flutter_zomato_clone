import 'package:flutter_zomato_clone/model/restaurant/restaurant_model.dart';

import '../../data/dummy_data/dummy_db.dart';
import '../../model/data_model/grid_item_data_model.dart';

class DeliveryController {
  List<GridItemDataModel> getGridItems() {
    return DummyDb.deliveryGridItemMapList;
  }

  List<RestaurantModel> getRestaurants() {
    return DummyDb.restaurantsList.map((restaurant) {
      return RestaurantModel(
        foodTypes: restaurant.foodTypeIds
            .map((e) => DummyDb.foodTypeList
                .firstWhere((element) => element.foodTypeId == e)
                .foodTypeTitle)
            .toList(),
        rating: restaurant.rating,
        ratingCount: restaurant.ratingCount,
        place: restaurant.place,
        distanceInKM: restaurant.distanceInKm,
        dishes: DummyDb.dishesList
            .where((element) => restaurant.foodTypeIds
                .any((item) => element.foodTypeIds.contains(item)))
            .toList(),
        name: restaurant.restaurantName,
      );
    }).toList();
  }
}
