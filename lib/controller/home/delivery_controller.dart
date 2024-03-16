import 'package:flutter_zomato_clone/model/restaurant/restaurant_model.dart';

import '../../data/dummy_data/dummy_db.dart';
import '../../model/data_model/grid_item_data_model.dart';

class DeliveryController {
  List<GridItemDataModel> getGridItems() {
    return DummyDb.deliveryGridItemMapList;
  }

  List<RestaurantModel> getRestaurants() {
    return [];
  }
}
