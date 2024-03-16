import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class DiningDetailsSliverTabBar extends StatelessWidget {
  const DiningDetailsSliverTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: ColorConstants.primaryWhite,
      expandedHeight: kTextTabBarHeight,
      toolbarHeight: kTextTabBarHeight,
      automaticallyImplyLeading: false,
      collapsedHeight: kTextTabBarHeight,
      primary: false,
      pinned: true,
      leadingWidth: 0,
      titleSpacing: 0,
      title: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: ColorConstants.black3c.withOpacity(0.5)),
        child: TabBar(
          isScrollable: true,
          physics: const NeverScrollableScrollPhysics(),
          tabAlignment: TabAlignment.start,
          indicatorWeight: 4,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: ColorConstants.primaryColor),
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: ColorConstants.black3c.withOpacity(0.5)),
          tabs: const [
            Tab(
              child: Text('Photos'),
            ),
            Tab(
              child: Text('Menu'),
            ),
            Tab(
              child: Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}
