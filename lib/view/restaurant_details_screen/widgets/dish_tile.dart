import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../common/widgets/diet_icon.dart';
import '../../../utils/constants/colors.dart';

class DishTile extends StatelessWidget {
  const DishTile({
    super.key,
    required this.dishItem,
    required this.showDivider,
  });

  final Map dishItem;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (dishItem['diet_type'] == 'veg') const DietIcon.veg(),
                    if (dishItem['diet_type'] == 'non-veg')
                      const DietIcon.nonVeg(),
                    const SizedBox(height: 5),
                    Text(
                      dishItem['dish_name'],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 5),
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.amber, width: 0.2),
                          color: Colors.amber.shade50.withOpacity(0.5),
                        ),
                        child: RatingStars(
                          value: dishItem['rating'],
                          starSize: 11,
                          valueLabelVisibility: false,
                          starColor: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${dishItem['rating_count']} ratings',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: ColorConstants.black3c.withOpacity(0.7),
                        ),
                      )
                    ]),
                    const SizedBox(height: 5),
                    Text('₹${dishItem['amount']}'),
                    const SizedBox(height: 10),
                    Text(
                      '${dishItem['dish_description']}',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: ColorConstants.black3c.withOpacity(0.4)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    margin: const EdgeInsets.only(bottom: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          dishItem['image_url'],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 15,
                    left: 15,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('ADD'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        if (showDivider)
          DottedDashedLine(
            height: 1,
            width: double.infinity,
            axis: Axis.horizontal,
            dashColor: ColorConstants.black3c.withOpacity(0.15),
          ),
      ],
    );
  }
}
