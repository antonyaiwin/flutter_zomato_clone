class DishDataModel {
  int dishId;
  List<int> categoryIds;
  String dishName;
  String dishDescription;
  int amount;
  double rating;
  int ratingCount;
  String imageUrl;
  String dietType;

  DishDataModel({
    required this.dishId,
    required this.categoryIds,
    required this.dishName,
    required this.dishDescription,
    required this.amount,
    required this.rating,
    required this.ratingCount,
    required this.imageUrl,
    required this.dietType,
  });

  factory DishDataModel.fromJson(Map<String, dynamic> json) => DishDataModel(
        dishId: json["dish_id"],
        categoryIds: List<int>.from(json["category_ids"].map((x) => x)),
        dishName: json["dish_name"],
        dishDescription: json["dish_description"],
        amount: json["amount"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["rating_count"],
        imageUrl: json["image_url"],
        dietType: json["diet_type"],
      );

  Map<String, dynamic> toJson() => {
        "dish_id": dishId,
        "category_ids": List<dynamic>.from(categoryIds.map((x) => x)),
        "dish_name": dishName,
        "dish_description": dishDescription,
        "amount": amount,
        "rating": rating,
        "rating_count": ratingCount,
        "image_url": imageUrl,
        "diet_type": dietType,
      };
}
