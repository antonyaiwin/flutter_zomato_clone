import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';

import '../../model/data_model/grid_item_data_model.dart';
import '../../model/restaurant/restaurant_model.dart';

class DiningController {
  List<GridItemDataModel> getGridItems() {
    return DummyDb.diningGridItemMapList;
  }

  List<RestaurantModel> getRestaurants() {
    return [];
  }
}
