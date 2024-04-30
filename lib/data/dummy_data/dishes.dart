part of 'dummy_db.dart';

abstract class _Dishes {
  static final List<Map<String, dynamic>> dishList = [
    // Mandi
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
          'https://images.pexels.com/photos/18620325/pexels-photo-18620325/free-photo-of-chicken-mandi.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [1, 5],
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
          'https://images.pexels.com/photos/18698228/pexels-photo-18698228/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [1, 5],
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
          'https://images.pexels.com/photos/18698236/pexels-photo-18698236/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [1, 5],
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
          'https://images.pexels.com/photos/18698227/pexels-photo-18698227/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [1, 5],
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
          'https://images.pexels.com/photos/18698264/pexels-photo-18698264/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [1, 5],
    },

    // Arabian
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
          'https://images.pexels.com/photos/18698222/pexels-photo-18698222/free-photo-of-food-photography.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [1],
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
          'https://images.pexels.com/photos/3926124/pexels-photo-3926124.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [1],
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
          'https://images.pexels.com/photos/5946433/pexels-photo-5946433.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [1],
    },
    // Beverages
    {
      'dish_id': 10,
      'category_ids': [4],
      'dish_name': 'Pepsi Max 500ml',
      'dish_description': 'Pepsi 500ml Can',
      'amount': 45.0,
      'rating': 4.1,
      'rating_count': 2,
      'image_url':
          'https://images.pexels.com/photos/11942006/pexels-photo-11942006.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [9],
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
          'https://images.pexels.com/photos/1484678/pexels-photo-1484678.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [9],
    },

    // Chinese
    {
      'dish_id': 10,
      'category_ids': [5],
      'dish_name': 'Veg Fried Rice',
      'dish_description': 'Pure Veg fried rice',
      'amount': 150,
      'rating': 4.1,
      'rating_count': 2,
      'image_url':
          'https://images.pexels.com/photos/3926124/pexels-photo-3926124.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [2],
    },
    {
      'dish_id': 11,
      'category_ids': [5],
      'dish_name': 'Chicken Fried Rice',
      'dish_description': 'Freshly prepared chilled lime juice',
      'amount': 180,
      'rating': 4.2,
      'rating_count': 562,
      'image_url':
          'https://images.pexels.com/photos/8992927/pexels-photo-8992927.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [2],
    },

    // Biryani
    // South Indian
    {
      'dish_id': 10,
      'category_ids': [6],
      'dish_name': 'Chicken Biryani',
      'dish_description': 'Chicken biryani full',
      'amount': 150,
      'rating': 4.1,
      'rating_count': 2,
      'image_url':
          'https://images.pexels.com/photos/12737656/pexels-photo-12737656.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [3, 12],
    },
    {
      'dish_id': 11,
      'category_ids': [6],
      'dish_name': 'Veg Biryani',
      'dish_description': 'Freshly prepared Veg Biryani full',
      'amount': 150.0,
      'rating': 4.2,
      'rating_count': 56,
      'image_url':
          'https://images.pexels.com/photos/3926133/pexels-photo-3926133.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [3, 12],
    },

    // Kerala
    {
      'dish_id': 10,
      'category_ids': [7],
      'dish_name': 'Idli 3ps',
      'dish_description': 'Freshly steamed rice cake',
      'amount': 80.0,
      'rating': 4.1,
      'rating_count': 2,
      'image_url':
          'https://images.pexels.com/photos/4331491/pexels-photo-4331491.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [4],
    },
    {
      'dish_id': 11,
      'category_ids': [7],
      'dish_name': 'Ghee Dosa',
      'dish_description': 'Traditional dosa made with ghee',
      'amount': 70.0,
      'rating': 4.2,
      'rating_count': 56,
      'image_url':
          'https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [4],
    },

    // Shawarma
    {
      'dish_id': 10,
      'category_ids': [8],
      'dish_name': 'Full Meat Shawarma(Chicken)',
      'dish_description': 'Chicken Full Meat Shawarma',
      'amount': 210.0,
      'rating': 4.7,
      'rating_count': 2255,
      'image_url':
          'https://images.pexels.com/photos/13292526/pexels-photo-13292526.png?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [6],
    },
    {
      'dish_id': 11,
      'category_ids': [8],
      'dish_name': 'Shawarma Plate',
      'dish_description': '',
      'amount': 300,
      'rating': 4.2,
      'rating_count': 5645,
      'image_url':
          'https://images.pexels.com/photos/6897730/pexels-photo-6897730.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [6],
    },

    // Burger
    {
      'dish_id': 10,
      'category_ids': [9],
      'dish_name': 'Juicy Chicken Burger',
      'dish_description': '',
      'amount': 210.0,
      'rating': 4.1,
      'rating_count': 552,
      'image_url':
          'https://images.pexels.com/photos/18867543/pexels-photo-18867543/free-photo-of-burger-served-in-a-restaurant.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [7],
    },
    {
      'dish_id': 11,
      'category_ids': [9],
      'dish_name': 'Chicker Poper Burger',
      'dish_description': 'Juicy Burger with crunchy chicken',
      'amount': 250.0,
      'rating': 4.2,
      'rating_count': 56,
      'image_url':
          'https://images.pexels.com/photos/12129480/pexels-photo-12129480.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [7],
    },

    // Shake
    {
      'dish_id': 10,
      'category_ids': [17],
      'dish_name': 'Strawberry Milk Shake',
      'dish_description': '',
      'amount': 150.0,
      'rating': 4.1,
      'rating_count': 2464,
      'image_url':
          'https://images.pexels.com/photos/8805097/pexels-photo-8805097.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [8],
    },
    {
      'dish_id': 11,
      'category_ids': [17],
      'dish_name': 'Strawberry Smoothie',
      'dish_description': '',
      'amount': 150.0,
      'rating': 4.2,
      'rating_count': 56,
      'image_url':
          'https://images.pexels.com/photos/5338141/pexels-photo-5338141.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [8],
    },

    // Fast Food
    {
      'dish_id': 10,
      'category_ids': [11],
      'dish_name': 'French Fries',
      'dish_description': '',
      'amount': 100.0,
      'rating': 4.1,
      'rating_count': 245,
      'image_url':
          'https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [10],
    },
    {
      'dish_id': 11,
      'category_ids': [11],
      'dish_name': 'Double Egg Bulls Eye',
      'dish_description': '',
      'amount': 70.0,
      'rating': 4.2,
      'rating_count': 56,
      'image_url':
          'https://images.pexels.com/photos/8992926/pexels-photo-8992926.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'egg',
      "food_type_ids": [10],
    },
    {
      'dish_id': 11,
      'category_ids': [11],
      'dish_name': 'Chicken Cutlet 3ps',
      'dish_description': '',
      'amount': 70.0,
      'rating': 4.8,
      'rating_count': 556,
      'image_url':
          'https://images.pexels.com/photos/8992924/pexels-photo-8992924.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [10],
    },

    // Pizza
    {
      'dish_id': 10,
      'category_ids': [12],
      'dish_name': 'Peporoni with Egg Toppings',
      'dish_description': '',
      'amount': 250.0,
      'rating': 4.1,
      'rating_count': 2,
      'image_url':
          'https://images.pexels.com/photos/845811/pexels-photo-845811.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [11],
    },

    // North Indian
    {
      'dish_id': 10,
      'category_ids': [13],
      'dish_name': 'Chicken Kebab',
      'dish_description': '',
      'amount': 230.0,
      'rating': 4.1,
      'rating_count': 4642,
      'image_url':
          'https://images.pexels.com/photos/2233729/pexels-photo-2233729.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [13],
    },

    // Bakery
    // Desserts
    {
      'dish_id': 10,
      'category_ids': [14],
      'dish_name': 'Macaroons 4ps',
      'dish_description': '',
      'amount': 200.0,
      'rating': 4.1,
      'rating_count': 562,
      'image_url':
          'https://images.pexels.com/photos/808941/pexels-photo-808941.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'egg',
      "food_type_ids": [14, 15],
    },
    {
      'dish_id': 11,
      'category_ids': [14],
      'dish_name': 'Chocolate Chip Cookie 4ps',
      'dish_description': '',
      'amount': 80.0,
      'rating': 4.2,
      'rating_count': 56,
      'image_url':
          'https://images.pexels.com/photos/7243524/pexels-photo-7243524.jpeg?auto=compress&cs=tinysrgb&w=600',
      'diet_type': 'veg',
      "food_type_ids": [14, 15],
    },

    // Cafe
    // Coffee
    {
      'dish_id': 10,
      'category_ids': [17],
      'dish_name': 'Cappuccino',
      'dish_description': '',
      'amount': 250.0,
      'rating': 4.1,
      'rating_count': 562,
      'image_url':
          'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [16, 17],
    },
    {
      'dish_id': 11,
      'category_ids': [17],
      'dish_name': 'Iced Coffee',
      'dish_description': '',
      'amount': 50.0,
      'rating': 4.2,
      'rating_count': 56,
      'image_url':
          'https://images.pexels.com/photos/8605915/pexels-photo-8605915.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'veg',
      "food_type_ids": [16, 17],
    },

    // Seafood
    {
      'dish_id': 10,
      'category_ids': [16],
      'dish_name': 'Crab Fried Full',
      'dish_description': '',
      'amount': 350.0,
      'rating': 4.1,
      'rating_count': 562,
      'image_url':
          'https://images.pexels.com/photos/775863/pexels-photo-775863.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [18],
    },
    {
      'dish_id': 11,
      'category_ids': [16],
      'dish_name': 'Lobster Fry',
      'dish_description': '',
      'amount': 400.0,
      'rating': 4.2,
      'rating_count': 456,
      'image_url':
          'https://images.pexels.com/photos/4553120/pexels-photo-4553120.jpeg?auto=compress&cs=tinysrgb&w=500&h=500&dpr=1',
      'diet_type': 'non-veg',
      "food_type_ids": [18],
    },
  ];
}
