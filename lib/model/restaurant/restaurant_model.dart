import 'package:flutter_zomato_clone/model/dishes/dish_model.dart';

class RestaurantModel {
  final String name;
  final List<String> foodTypes;
  final double rating;
  final double distanceInKM;
  final List<DishModel> dishes;

  RestaurantModel({
    required this.foodTypes,
    required this.rating,
    required this.distanceInKM,
    required this.dishes,
    required this.name,
  });
}
