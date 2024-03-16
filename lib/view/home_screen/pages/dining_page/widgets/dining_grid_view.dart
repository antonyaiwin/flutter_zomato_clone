import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zomato_clone/controller/home/dining_controller.dart';
import 'package:flutter_zomato_clone/model/data_model/grid_item_data_model.dart';

import '../../../../../common/widgets/spacer.dart';
import '../../../../../utils/constants/colors.dart';

class DiningGridView extends StatefulWidget {
  const DiningGridView({
    super.key,
    required this.controller,
  });
  final DiningController controller;

  @override
  State<DiningGridView> createState() => _DiningGridViewState();
}

class _DiningGridViewState extends State<DiningGridView> {
  List<GridItemDataModel> get gridItemModelList =>
      widget.controller.gridItemModelList;
  @override
  void initState() {
    widget.controller.loadGridItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 0,
            childAspectRatio: 10 / 9),
        itemCount: gridItemModelList.length,
        itemBuilder: (context, index) {
          var item = gridItemModelList[index];
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
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
