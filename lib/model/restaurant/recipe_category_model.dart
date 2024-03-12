import 'dart:convert';

import 'package:flutter_zomato_clone/utils/constants/enums.dart';

RecipeCategoryModel recipeCategoryModelFromJson(String str) =>
    RecipeCategoryModel.fromJson(json.decode(str));

String recipeCategoryModelToJson(RecipeCategoryModel data) =>
    json.encode(data.toJson());

class RecipeCategoryModel {
  String categoryTitle;
  List<DishItemModel> dishList;

  RecipeCategoryModel({
    required this.categoryTitle,
    required this.dishList,
  });

  factory RecipeCategoryModel.fromJson(Map<String, dynamic> json) =>
      RecipeCategoryModel(
        categoryTitle: json["category_title"],
        dishList: List<DishItemModel>.from(
            json["dish_list"].map((x) => DishItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_title": categoryTitle,
        "dish_list": List<dynamic>.from(dishList.map((x) => x.toJson())),
      };
}

class DishItemModel {
  String dishName;
  String dishDescription;
  double amount;
  double rating;
  int ratingCount;
  String imageUrl;
  DietType dietType;

  DishItemModel({
    required this.dishName,
    required this.dishDescription,
    required this.amount,
    required this.rating,
    required this.ratingCount,
    required this.imageUrl,
    required this.dietType,
  });

  factory DishItemModel.fromJson(Map<String, dynamic> json) => DishItemModel(
        dishName: json["dish_name"],
        dishDescription: json["dish_description"],
        amount: json["amount"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["rating_count"],
        imageUrl: json["image_url"],
        dietType: DietType.fromString(json["diet_type"]),
      );

  Map<String, dynamic> toJson() => {
        "dish_name": dishName,
        "dish_description": dishDescription,
        "amount": amount,
        "rating": rating,
        "rating_count": ratingCount,
        "image_url": imageUrl,
        "diet_type": dietType.value,
      };
}
