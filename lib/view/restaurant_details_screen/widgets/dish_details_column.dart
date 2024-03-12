import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_zomato_clone/model/restaurant/recipe_category_model.dart';
import 'package:flutter_zomato_clone/utils/constants/enums.dart';

import '../../../common/widgets/diet_icon.dart';
import '../../../utils/constants/colors.dart';

class DishDetailsColumn extends StatelessWidget {
  const DishDetailsColumn({
    super.key,
    required this.dishItem,
    required this.showPrice,
  });

  final DishItemModel dishItem;
  final bool showPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (dishItem.dietType == DietType.veg) const DietIcon.veg(),
        if (dishItem.dietType == DietType.nonVeg) const DietIcon.nonVeg(),
        if (dishItem.dietType == DietType.egg) const DietIcon.egg(),
        const SizedBox(height: 5),
        Text(
          dishItem.dishName,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.amber, width: 0.2),
                color: Colors.amber.shade50.withOpacity(0.5),
              ),
              child: RatingStars(
                value: dishItem.rating,
                starSize: 11,
                valueLabelVisibility: false,
                starColor: Colors.amber,
              ),
            ),
            const SizedBox(width: 3),
            Text(
              '${dishItem.ratingCount} ratings',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w100,
                color: ColorConstants.black3c.withOpacity(0.7),
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        if (showPrice) ...[
          Text('₹${dishItem.amount}'),
          const SizedBox(height: 10),
        ],
        Text(
          dishItem.dishDescription,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
              color: ColorConstants.black3c.withOpacity(0.4)),
        ),
      ],
    );
  }
}
