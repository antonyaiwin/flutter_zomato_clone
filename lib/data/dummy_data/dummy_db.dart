import 'package:flutter_zomato_clone/model/data_model/category_data_model.dart';
import 'package:flutter_zomato_clone/model/data_model/dish_data_model.dart';
import 'package:flutter_zomato_clone/model/data_model/food_type_data_model.dart';
import 'package:flutter_zomato_clone/model/data_model/grid_item_data_model.dart';
import 'package:flutter_zomato_clone/model/data_model/restaurant_data_model.dart';

part 'categories.dart';
part 'delivery_grid_items.dart';
part 'dining_grid_items.dart';
part 'dishes.dart';
part 'restaurants.dart';
part 'food_types.dart';

abstract class DummyDb {
  static List<CategoryDataModel> get categoryModelList =>
      _Categories.categoryList
          .map((e) => CategoryDataModel.fromJson(e))
          .toList();

  static List<GridItemDataModel> get deliveryGridItemModelList =>
      _DeliveryGridItems.deliveryGridItemMapList
          .map((e) => GridItemDataModel.fromJson(e))
          .toList();

  static List<GridItemDataModel> get diningGridItemModelList =>
      _DiningGridItems.diningGridItemMapList
          .map((e) => GridItemDataModel.fromJson(e))
          .toList();

  static List<DishDataModel> get dishesModelList =>
      _Dishes.dishList.map((e) => DishDataModel.fromJson(e)).toList();

  static List<RestaurantDataModel> get restaurantsModelList =>
      _Restaurants.restaurantList
          .map((e) => RestaurantDataModel.fromJson(e))
          .toList();

  static List<FoodTypeModel> get foodTypeModelList =>
      _FoodTypes.foodTypeMapList.map((e) => FoodTypeModel.fromJson(e)).toList();
}
