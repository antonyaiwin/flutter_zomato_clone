class UserModel {
  final String name;
  final String? email;
  final String phoneNo;
  final bool isVegetarian;

  UserModel({
    required this.name,
    this.email,
    required this.phoneNo,
    required this.isVegetarian,
  });
}
