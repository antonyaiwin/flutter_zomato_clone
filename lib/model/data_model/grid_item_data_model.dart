class GridItemDataModel {
  final String imageUrl;
  final String name;

  const GridItemDataModel({
    required this.name,
    required this.imageUrl,
  });

  factory GridItemDataModel.fromJson(Map<String, dynamic> json) =>
      GridItemDataModel(
        imageUrl: json["imageUrl"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "name": name,
      };
}
