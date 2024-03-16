part of 'dummy_db.dart';

abstract class _Dishes {
  static final List<Map<String, dynamic>> dishList = [
    {
      'dish_id': 1,
      'category_ids': [1, 2],
      'dish_name': 'Chicken Kuzhimandi',
      'dish_description':
          'Traditional chicken mandi served with sauce, salad and mayonnaise',
      'amount': 204.0,
      'rating': 4.1,
      'rating_count': 644,
      'image_url':
          'https://images.pexels.com/photos/18620325/pexels-photo-18620325/free-photo-of-chicken-mandi.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'non-veg'
    },
    {
      'dish_id': 2,
      'category_ids': [1, 2],
      'dish_name': 'Al Faham Mandi',
      'dish_description':
          'Served with the Chicken Al Faham and mandi rice with mayonnaise and vegetable platter',
      'amount': 228.0,
      'rating': 4.2,
      'rating_count': 1123,
      'image_url':
          'https://images.pexels.com/photos/18698228/pexels-photo-18698228/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'non-veg'
    },
    {
      'dish_id': 3,
      'category_ids': [1],
      'dish_name': 'Beef Kuzhimandi',
      'dish_description':
          'Served with the beef meat and mandi rice with mayonnaise and vegetable platter',
      'amount': 276.0,
      'rating': 4.1,
      'rating_count': 120,
      'image_url':
          'https://images.pexels.com/photos/18698236/pexels-photo-18698236/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'non-veg'
    },
    {
      'dish_id': 4,
      'category_ids': [2],
      'dish_name': 'Honey Al Faham Mandi',
      'dish_description':
          'Served with the Chicken Al Faham with Honey Flavouring and mandi rice with mayonnaise and vegetable platter',
      'amount': 240.0,
      'rating': 4.5,
      'rating_count': 210,
      'image_url':
          'https://images.pexels.com/photos/18698227/pexels-photo-18698227/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'non-veg'
    },
    {
      'dish_id': 5,
      'category_ids': [2],
      'dish_name': 'Peri Peri Al Faham Mandi',
      'dish_description':
          'Served with the spicy Peri Peri Chicken Al Faham and mandi rice with mayonnaise and vegetable platter',
      'amount': 240.0,
      'rating': 4.5,
      'rating_count': 414,
      'image_url':
          'https://images.pexels.com/photos/18698264/pexels-photo-18698264/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'non-veg'
    },
    {
      'dish_id': 6,
      'category_ids': [3],
      'dish_name': 'Al Faham',
      'dish_description':
          'Tasty Al faham chicken with kubboos, salad and mayonnaise',
      'amount': 144.0,
      'rating': 4.1,
      'rating_count': 382,
      'image_url':
          'https://images.pexels.com/photos/18698222/pexels-photo-18698222/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'non-veg'
    },
    {
      'dish_id': 7,
      'category_ids': [3],
      'dish_name': 'Rice',
      'dish_description': 'Only mandi rice',
      'amount': 108.0,
      'rating': 4.2,
      'rating_count': 93,
      'image_url':
          'https://images.pexels.com/photos/3926124/pexels-photo-3926124.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'veg'
    },
    {
      'dish_id': 8,
      'category_ids': [3],
      'dish_name': 'Spicy Chicken Only',
      'dish_description':
          'Spicy chicken flavoured with spices and with mandi flavouring',
      'amount': 144.0,
      'rating': 4.1,
      'rating_count': 10,
      'image_url':
          'https://images.pexels.com/photos/5946433/pexels-photo-5946433.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'non-veg'
    },
    {
      'dish_id': 9,
      'category_ids': [4],
      'dish_name': 'Pepsi 750ml',
      'dish_description': 'Pepsi 750ml bottle',
      'amount': 45.0,
      'rating': 4.1,
      'rating_count': 20,
      'image_url':
          'https://images.pexels.com/photos/9737410/pexels-photo-9737410.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'veg'
    },
    {
      'dish_id': 10,
      'category_ids': [4],
      'dish_name': 'Pepsi Max 750ml',
      'dish_description': 'Pepsi 750ml Can',
      'amount': 45.0,
      'rating': 4.1,
      'rating_count': 2,
      'image_url':
          'https://images.pexels.com/photos/11942006/pexels-photo-11942006.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'veg'
    },
    {
      'dish_id': 11,
      'category_ids': [4],
      'dish_name': 'Fresh Lime',
      'dish_description': 'Freshly prepared chilled lime juice',
      'amount': 50.0,
      'rating': 4.2,
      'rating_count': 56,
      'image_url':
          'https://images.pexels.com/photos/1484678/pexels-photo-1484678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'diet_type': 'veg'
    },
  ];
}
