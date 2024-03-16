class FoodTypeModel {
  int foodTypeId;
  String foodTypeTitle;

  FoodTypeModel({
    required this.foodTypeId,
    required this.foodTypeTitle,
  });

  factory FoodTypeModel.fromJson(Map<String, dynamic> json) => FoodTypeModel(
        foodTypeId: json["food_type_id"],
        foodTypeTitle: json["food_type_title"],
      );

  Map<String, dynamic> toJson() => {
        "food_type_id": foodTypeId,
        "food_type_title": foodTypeTitle,
      };
}
