import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/controller/home/delivery_controller.dart';

import '../../../../../common/widgets/spacer.dart';
import '../../../../../model/data_model/grid_item_data_model.dart';
import '../../../../../utils/constants/colors.dart';

class DishGridView extends StatefulWidget {
  const DishGridView({
    super.key,
    required this.controller,
  });
  final DeliveryController controller;

  @override
  State<DishGridView> createState() => _DishGridViewState();
}

class _DishGridViewState extends State<DishGridView> {
  late List<GridItemDataModel> dishGridItemModelList;

  @override
  void initState() {
    dishGridItemModelList = DeliveryController().getGridItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // padding: const EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 20,
        ),
        itemCount: dishGridItemModelList.length,
        itemBuilder: (context, index) {
          var item = dishGridItemModelList[index];
          return Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: ColorConstants.black3c.withOpacity(0.01),
                foregroundImage: NetworkImage(item.imageUrl),
              ),
              kVSpace(5),
              Text(
                item.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: ColorConstants.black3c.withOpacity(0.7),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
