class RestaurantDataModel {
  int restaurantId;
  String restaurantName;
  String place;
  List<int> foodTypeIds;
  double rating;
  String ratingCount;
  double distanceInKm;

  RestaurantDataModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.place,
    required this.foodTypeIds,
    required this.rating,
    required this.ratingCount,
    required this.distanceInKm,
  });

  factory RestaurantDataModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDataModel(
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        place: json["place"],
        foodTypeIds: List<int>.from(json["food_type_ids"].map((x) => x)),
        rating: json["rating"]?.toDouble(),
        ratingCount: json["rating_count"],
        distanceInKm: json["distance_in_km"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "place": place,
        "food_type_ids": List<dynamic>.from(foodTypeIds.map((x) => x)),
        "rating": rating,
        "rating_count": ratingCount,
        "distance_in_km": distanceInKm,
      };
}
