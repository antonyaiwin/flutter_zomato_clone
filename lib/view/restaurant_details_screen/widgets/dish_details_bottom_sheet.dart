import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/custom_button.dart';
import 'package:flutter_zomato_clone/model/data_model/dish_data_model.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';

import '../../../common/widgets/add_item_button.dart';
import 'dish_details_column.dart';

class DishDetailsBottomSheet extends StatefulWidget {
  const DishDetailsBottomSheet(
      {super.key, required this.dishItem, required this.controller});
  final DishDataModel dishItem;
  final ScrollController controller;
  @override
  State<DishDetailsBottomSheet> createState() => _DishDetailsBottomSheetState();
}

class _DishDetailsBottomSheetState extends State<DishDetailsBottomSheet> {
  DishDataModel get dishItem => widget.dishItem;
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            controller: widget.controller,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ColorConstants.primaryWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 5 / 3,
                      child: Image.network(
                        dishItem.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                    child:
                        DishDetailsColumn(dishItem: dishItem, showPrice: false),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: ColorConstants.primaryWhite,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          alignment: Alignment.center,
          height: kToolbarHeight + 15,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: AddItemButton(
                  count: itemCount,
                  onAddPressed: () {
                    setState(() {
                      itemCount++;
                    });
                  },
                  onRemovePressed: () {
                    if (itemCount == 1) {
                      Navigator.pop(context);
                      return;
                    }
                    setState(() {
                      itemCount--;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 5,
                child: CustomButton(
                  onTap: () {},
                  child: Text(
                    'Add item ₹${(dishItem.amount * itemCount).toStringAsFixed(0)}',
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
