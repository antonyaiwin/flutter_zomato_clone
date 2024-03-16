import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/controller/home/dining_controller.dart';
import 'package:flutter_zomato_clone/view/dining_details_screen/dining_details_screen.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/elevated_card.dart';
import '../../../../common/widgets/spacer.dart';
import '../../../../model/restaurant/restaurant_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../home_screen/widgets/rating_card.dart';

class DiningDetailsSliverBody extends StatelessWidget {
  DiningDetailsSliverBody({
    super.key,
    required this.item,
  });

  final RestaurantModel item;
  final List<RestaurantModel> similarModels =
      DiningController.getSimilarRestaurants(4);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: ColorConstants.primaryBlack.withOpacity(0.8)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: ColorConstants.primaryWhite,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 300),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text(
                      'Photos',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Bootstrap.camera,
                          size: 15,
                        ),
                        kHSpace(4),
                        const Text(
                          'add photo',
                          style: TextStyle(
                            color: ColorConstants.primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              kVSpace(20),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 4 / 5,
                        child: Image.network(
                          item.dishes[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kHSpace(10);
                  },
                  itemCount: item.dishes.length,
                ),
              ),
              kVSpace(40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Last updated 3 months ago',
                      style: TextStyle(
                        color: ColorConstants.primaryBrown,
                      ),
                    ),
                  ],
                ),
              ),
              kVSpace(30),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 160,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AspectRatio(
                            aspectRatio: 4 / 5,
                            child: Image.network(
                              'https://images.pexels.com/photos/4913361/pexels-photo-4913361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text('Menu'),
                        Text(
                          '1 page',
                          style: TextStyle(
                            color: ColorConstants.black3c.withOpacity(0.5),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kHSpace(10);
                  },
                  itemCount: 1,
                ),
              ),
              kVSpace(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About the restaurant',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    kVSpace(20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 18,
                      ).copyWith(bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ColorConstants.black3c.withOpacity(0.5),
                            width: 0.5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                MingCute.currency_rupee_line,
                                color: ColorConstants.black26,
                              ),
                              kHSpace(5),
                              Text(
                                '₹${item.dishes[0].amount * 2} for two',
                              ),
                            ],
                          ),
                          kVSpace(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.dinner_dining,
                                color: ColorConstants.black26,
                              ),
                              kHSpace(5),
                              Text(
                                'Serves ${item.foodTypes[0]}, ${item.foodTypes[1]}, ${item.foodTypes[2]}',
                              ),
                            ],
                          ),
                          kVSpace(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                MingCute.location_line,
                                color: ColorConstants.black26,
                              ),
                              kHSpace(5),
                              Text(
                                item.place,
                              ),
                            ],
                          ),
                          kVSpace(15),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.directions_outlined),
                                        kHSpace(5),
                                        const Text('Directions')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: ColorConstants.black3c.withOpacity(0.15),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Iconsax.call_calling_outline,
                                          size: 20,
                                        ),
                                        kHSpace(5),
                                        const Text('Call restaurant')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    kVSpace(20),
                    Text(
                      'F A C I L I T I E S',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorConstants.black3c.withOpacity(0.8),
                      ),
                    ),
                    kVSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle_outline,
                                color: ColorConstants.ratingBgGreen,
                              ),
                              kHSpace(5),
                              Text(
                                'Home Delivery',
                                style: TextStyle(
                                  color:
                                      ColorConstants.black3c.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle_outline,
                                color: ColorConstants.ratingBgGreen,
                              ),
                              kHSpace(5),
                              Text(
                                'Takeaway Available',
                                style: TextStyle(
                                  color:
                                      ColorConstants.black3c.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              kVSpace(50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Similar restaurants',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 2 / 4.7,
                      ),
                      itemBuilder: (context, index) {
                        var item = similarModels[index];
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DiningDetailsScreen(item: item),
                            ),
                          ),
                          child: ElevatedCard(
                            padding: EdgeInsets.zero,
                            elevation: 8,
                            child: Row(
                              children: [
                                AspectRatio(
                                  aspectRatio: 5.5 / 6,
                                  child: Image.network(
                                    item
                                        .dishes[Random()
                                            .nextInt(item.dishes.length)]
                                        .imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                kHSpace(10),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      kVSpace(10),
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '${item.distanceInKM} kms away',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: ColorConstants.black3c
                                                .withOpacity(0.5)),
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          RatingCard(rating: item.rating),
                                        ],
                                      ),
                                      kVSpace(10),
                                    ],
                                  ),
                                ),
                                kHSpace(5),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 4,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
