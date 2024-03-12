enum DietType {
  veg('veg'),
  nonVeg('non-veg'),
  egg('egg'),
  unknown('unknown');

  final String value;

  const DietType(this.value);

  static DietType fromString(String type) {
    switch (type) {
      case 'veg':
        return DietType.veg;
      case 'non-veg':
        return DietType.nonVeg;
      case 'egg':
        return DietType.egg;
      default:
        return DietType.unknown;
    }
  }
}
