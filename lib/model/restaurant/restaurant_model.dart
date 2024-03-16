import '../data_model/dish_data_model.dart';

class RestaurantModel {
  final String name;
  final List<String> foodTypes;
  final double rating;
  final String ratingCount;
  final String place;
  final double distanceInKM;
  final List<DishDataModel> dishes;

  RestaurantModel({
    required this.foodTypes,
    required this.rating,
    required this.ratingCount,
    required this.place,
    required this.distanceInKM,
    required this.dishes,
    required this.name,
  });
}
