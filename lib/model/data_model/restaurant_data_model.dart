class RestaurantDataModel {
  int restaurantId;
  String restaurantName;
  String place;

  RestaurantDataModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.place,
  });

  factory RestaurantDataModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDataModel(
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        place: json["place"],
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "place": place,
      };
}
