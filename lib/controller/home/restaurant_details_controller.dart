import 'package:flutter_zomato_clone/model/restaurant/recipe_category_model.dart';

class RestaurantDetailsController {
  List<RecipeCategoryModel> recipeCategoryModelList;

  DishFilter dishFilter;

  RestaurantDetailsController()
      : recipeCategoryModelList = _getRecipeCategoryModelList(),
        dishFilter = DishFilter._();

  static List<RecipeCategoryModel> _getRecipeCategoryModelList() {
    return [];
  }

  static final List offersMap = [
    {
      'title': '50% OFF up to ₹100',
      'sub_title': 'Use code WELCOM50 | above ₹159',
    },
    {
      'title': 'Flat ₹150 OFF',
      'sub_title': 'Use code GOT150 | above ₹499',
    },
  ];
}

class DishFilter {
  bool veg = false;
  bool nonVeg = false;
  bool egg = false;
  bool topRated = false;
  DishSortType sortType = DishSortType.unknown;
  DishFilter._();

  bool get filtered => veg || nonVeg || egg || topRated;

  void toggleVeg() {
    veg = !veg;
  }

  void toggleNonVeg() {
    nonVeg = !nonVeg;
  }

  void toggleEgg() {
    egg = !egg;
  }

  void toggleTopRated() {
    topRated = !topRated;
  }

  void clearAll() {
    veg = false;
    nonVeg = false;
    egg = false;
    topRated = false;
    sortType = DishSortType.unknown;
  }
}

enum DishSortType {
  priceLowToHigh(value: 'price_low_to_high'),
  priceHighToLow(value: 'price_high_to_low'),
  ratingHighToLow(value: 'rating_high_to_low'),
  unknown(value: 'unknown');

  final String value;

  const DishSortType({required this.value});
}
