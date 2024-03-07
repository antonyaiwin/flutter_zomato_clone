import 'dart:math';

import 'package:flutter_zomato_clone/model/dishes/dish_model.dart';
import 'package:flutter_zomato_clone/model/restaurant/restaurant_model.dart';

abstract class DummyDb {
  static const List<DishModel> dishList = [
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/12737656/pexels-photo-12737656.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Biryanibvnbvxjv hjdsknvmnmnvjbnvmncj nj  jdjnvj',
        price: 250),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/803290/pexels-photo-803290.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Pizza',
        price: 169),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/616353/pexels-photo-616353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Chicken',
        price: 240),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/4149260/pexels-photo-4149260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Fried Rice',
        price: 230),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/18620325/pexels-photo-18620325/free-photo-of-chicken-mandi.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Chicken Mandi',
        price: 250),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/4728230/pexels-photo-4728230.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Shawarma',
        price: 165),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/9609857/pexels-photo-9609857.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Parotta',
        price: 20),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/1027811/pexels-photo-1027811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Cake',
        price: 600),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/2664216/pexels-photo-2664216.jpeg?auto=compress&cs=tinysrgb&w=600',
        name: 'Chinese',
        price: 180),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/8346891/pexels-photo-8346891.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Paratha',
        price: 20),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/3738730/pexels-photo-3738730.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Burger',
        price: 149),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/4611424/pexels-photo-4611424.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        // 'https://images.pexels.com/photos/8887055/pexels-photo-8887055.jpeg?auto=compress&cs=tinysrgb&w=600',
        name: 'North Indian',
        price: 280),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/11115801/pexels-photo-11115801.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Paneer',
        price: 150),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Dosa',
        price: 120),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/15801053/pexels-photo-15801053/free-photo-of-fried-rolls-with-vegetables.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Rolls',
        price: 120),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/8018000/pexels-photo-8018000.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Chilli Chicken',
        price: 120),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/2284604/pexels-photo-2284604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        // 'https://images.pexels.com/photos/3209101/pexels-photo-3209101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Chowmein',
        price: 180),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/5410418/pexels-photo-5410418.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'South Indian',
        price: 110),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/1362534/pexels-photo-1362534.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Ice Cream',
        price: 60),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/4331491/pexels-photo-4331491.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Idli',
        price: 40),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/18803177/pexels-photo-18803177/free-photo-of-plate-with-greasy-momos-dumplings.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Momos',
        price: 150),
    DishModel(
        imageUrl:
            'https://images.pexels.com/photos/115740/pexels-photo-115740.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Fries',
        price: 150),
  ];

  static const List<String> _foodTypeList = [
    'Arabian',
    'Kerala',
    'Mandi',
    'Shawarma',
    'Burger',
    'Shake',
    'Fast Food',
    'Pizza',
    'South Indian',
    'North Indian',
  ];
  static const List<String> _restaurantList = [
    'The Hungry Panda',
    'Italian Delights',
    'Spicy Bites Grill',
    'Sushi Fusion Palace',
    'Mama Mia Pizzeria',
    'Taco Tango',
    'Golden Wok Express',
    'Flavors of India',
    'Cheese and Crust Burgers',
    'Thai Orchid Garden',
    'Café de Paris',
    'Sizzling Sizzlers',
    'The Green Leaf Salad Bar',
    'Seafood Sensations',
    'Chopstick Heaven',
    'BBQ Bonanza',
    'La Dolce Vita Gelato',
    'Mediterranean Magic',
    'Bollywood Spice Kitchen',
    'Sweet Tooth Treats',
    'Firehouse Grill',
    'Vegetarian Vibes',
    'Burger Barn',
    'The Gourmet Grill',
    'Taste of Tuscany',
    'Wok and Roll Noodles',
    'Crunchy Crust Pies',
    'Crepes and Coffee Corner',
  ];
  static const List<String> placesInErnakulam = [
    'Edappally',
    'Ernakulam',
    'MG Road',
    'Vyttila',
    'Kakkanad',
    'Cheranelloor',
    'Kalamassery',
    'Tripunithura',
    'Kaloor',
    'Palarivattom',
    'Kadavanthra',
    'Panampilly Nagar',
    'High Court',
    'Marine Drive',
  ];
  static List<RestaurantModel> get restaurants {
    return List.generate(_restaurantList.length, (index) {
      List newDishes = [];
      newDishes.addAll(dishList);
      newDishes.shuffle();
      return RestaurantModel(
          foodTypes: List.generate(3,
              (index) => _foodTypeList[Random().nextInt(_foodTypeList.length)]),
          rating: Random().nextDouble() * 5,
          ratingCount: '${Random().nextInt(600) + 100}',
          place: placesInErnakulam[Random().nextInt(placesInErnakulam.length)],
          distanceInKM: Random().nextDouble() * 5,
          dishes: List.generate(Random().nextInt(10) + 1, (index) {
            return newDishes.removeAt(index);
          }),
          name: _restaurantList[index]);
    });
  }
}
