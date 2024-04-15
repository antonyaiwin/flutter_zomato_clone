import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';
import 'package:flutter_zomato_clone/model/restaurant/recipe_category_model.dart';
import 'package:flutter_zomato_clone/utils/constants/enums.dart';

import '../../model/data_model/dish_data_model.dart';

class RestaurantDetailsController {
  List<RecipeCategoryModel> recipeCategoryModelList = [];

  double topRatedMin = 4.0;

  DishFilter dishFilter;

  RestaurantDetailsController() : dishFilter = DishFilter._();

  Future<bool> loadData() async {
    recipeCategoryModelList = _getRecipeCategoryModelList();
    return true;
  }

  Future<bool> refreshCategoryListWithFilters() async {
    List<RecipeCategoryModel> tempList;
    if (!dishFilter.filtered) {
      recipeCategoryModelList = _getRecipeCategoryModelList();
      // return true;
    } else {
      tempList = DummyDb.categoryModelList.map((category) {
        return RecipeCategoryModel(
            categoryTitle: category.categoryTitle,
            dishList: DummyDb.dishesModelList.where((element) {
              if (element.categoryIds.contains(category.categoryId)) {
                if (dishFilter.filtered) {
                  if (dishFilter.veg || dishFilter.nonVeg || dishFilter.egg) {
                    if ((dishFilter.veg && element.dietType == DietType.veg) ||
                        (dishFilter.nonVeg &&
                            element.dietType == DietType.nonVeg) ||
                        (dishFilter.egg && element.dietType == DietType.egg)) {
                      if (dishFilter.topRated) {
                        return element.rating > topRatedMin;
                      } else {
                        return true;
                      }
                    } else {
                      return false;
                    }
                  } else {
                    if (dishFilter.topRated) {
                      return element.rating > topRatedMin;
                    } else {
                      return true;
                    }
                  }
                } else {
                  return true;
                }
              }
              return false;
              // return element.categoryIds.contains(category.categoryId) &&
              //     (!dishFilter.topRated || element.rating > 4.0) &&
              //     (dishFilter.veg && element.dietType == DietType.veg ||
              //         dishFilter.nonVeg && element.dietType == DietType.nonVeg ||
              //         dishFilter.egg && element.dietType == DietType.egg);

              //      return element.categoryIds.contains(category.categoryId) &&
              // (!dishFilter.topRated || element.rating > 4.0) &&
              // (dishFilter.veg && element.dietType == DietType.veg ||
              //     dishFilter.nonVeg && element.dietType == DietType.nonVeg ||
              //     dishFilter.egg && element.dietType == DietType.egg);
            }).toList());
      }).toList();

      // removing empty categories
      recipeCategoryModelList =
          tempList.where((element) => element.dishList.isNotEmpty).toList();
    }

    // sorting
    log('dishfilter sorting ${dishFilter.sorted}');
    if (dishFilter.sorted) {
      log('sorted');
      List<DishDataModel> dishList = [];
      for (var element in recipeCategoryModelList) {
        dishList.addAll(element.dishList);
      }
      dishList.sort(
        (a, b) {
          if (dishFilter.sortType == DishSortType.priceLowToHigh) {
            return a.amount.compareTo(b.amount);
          } else if (dishFilter.sortType == DishSortType.priceHighToLow) {
            return b.amount.compareTo(a.amount);
          } else {
            return b.rating.compareTo(a.rating);
          }
        },
      );
      recipeCategoryModelList.clear();
      recipeCategoryModelList.add(RecipeCategoryModel(
          categoryTitle: dishFilter.sortType.value, dishList: dishList));
    }
    await Future.delayed(Durations.extralong1);
    return true;
  }

  static List<RecipeCategoryModel> _getRecipeCategoryModelList() {
    return DummyDb.categoryModelList.map((category) {
      return RecipeCategoryModel(
          categoryTitle: category.categoryTitle,
          dishList: DummyDb.dishesModelList
              .where((element) =>
                  element.categoryIds.contains(category.categoryId))
              .toList());
    }).toList();
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
  bool get sorted => sortType != DishSortType.unknown;

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
