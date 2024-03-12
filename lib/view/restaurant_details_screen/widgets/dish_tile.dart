import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/model/restaurant/recipe_category_model.dart';
import 'package:flutter_zomato_clone/utils/functions/custom_functions.dart';
import 'package:flutter_zomato_clone/view/restaurant_details_screen/widgets/dish_details_bottom_sheet.dart';

import '../../../utils/constants/colors.dart';
import 'dish_details_column.dart';

class DishTile extends StatelessWidget {
  const DishTile({
    super.key,
    required this.dishItem,
    required this.showDivider,
  });

  final DishItemModel dishItem;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyModalBottomSheet(
              context: context,
              builder: (context, scrollController) => DishDetailsBottomSheet(
                dishItem: dishItem,
                controller: scrollController,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 192,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DishDetailsColumn(
                    dishItem: dishItem,
                    showPrice: true,
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
                            dishItem.imageUrl,
                          ),
                          fit: BoxFit.cover,
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
