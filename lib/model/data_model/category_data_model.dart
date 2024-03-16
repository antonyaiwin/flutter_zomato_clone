class CategoryDataModel {
  int categoryId;
  String categoryTitle;

  CategoryDataModel({
    required this.categoryId,
    required this.categoryTitle,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(
        categoryId: json["category_id"],
        categoryTitle: json["category_title"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_title": categoryTitle,
      };
}
