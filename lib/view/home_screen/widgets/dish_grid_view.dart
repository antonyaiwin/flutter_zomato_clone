import 'package:flutter/material.dart';

import '../../../common/widgets/spacer.dart';
import '../../../data/dummy_data/dummy_db.dart';
import '../../../utils/constants/colors.dart';

class DishGridView extends StatelessWidget {
  const DishGridView({
    super.key,
  });

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
        itemCount: DummyDb.dishList.length,
        itemBuilder: (context, index) {
          var item = DummyDb.dishList[index];
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
