import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../common/widgets/spacer.dart';
import '../../../../../utils/constants/colors.dart';
import 'package:flutter_zomato_clone/data/dummy_data/dummy_db.dart';

class DiningGridView extends StatelessWidget {
  const DiningGridView({
    super.key,
  });
  List get itemList => DummyDb.dishList;
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
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          var item = itemList[index];
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
