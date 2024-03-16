import 'package:flutter_zomato_clone/model/restaurant/restaurant_model.dart';

import '../../data/dummy_data/dummy_db.dart';
import '../../model/data_model/grid_item_data_model.dart';

class DeliveryController {
  late List<GridItemDataModel> dishGridItemModelList;

  void loadGridItems() {
    dishGridItemModelList = DummyDb.deliveryGridItemModelList;
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
    }).toList();
  }
}
