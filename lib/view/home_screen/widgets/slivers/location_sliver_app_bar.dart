import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/spacer.dart';
import '../../../../utils/constants/colors.dart';
import '../elevated_search_field.dart';

class LocationSliverAppBar extends StatelessWidget {
  const LocationSliverAppBar({super.key});
  final double elevatedSearchFieldHeight = 55;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: false,
      surfaceTintColor: Colors.transparent,
      expandedHeight: kToolbarHeight + elevatedSearchFieldHeight,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1,
        background: Padding(
          padding: EdgeInsets.only(
            bottom: elevatedSearchFieldHeight,
            left: 16,
            right: 16,
          ),
          child: Row(
            children: [
              const Icon(EvaIcons.pin,
                  color: ColorConstants.primaryColor, size: 29),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Vadakkumbakam',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Eloor, dippo',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorConstants.black3c.withOpacity(0.6)),
                  ),
                ],
              ),
              const Spacer(),
              Ink(
                decoration: BoxDecoration(
                    color: ColorConstants.primaryWhite,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstants.black3c.withOpacity(0.5),
                        blurRadius: 2,
                      ),
                    ]),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  overlayColor: MaterialStatePropertyAll(
                      ColorConstants.primaryColor.withOpacity(0.12)),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(
                      Bootstrap.translate,
                      size: 18,
                      color: ColorConstants.primaryBlack,
                    ),
                  ),
                ),
              ),
              kHSpace(10),
              CircleAvatar(
                radius: 18,
                backgroundColor: ColorConstants.blue.withOpacity(0.5),
                child: const Text(
                  'E',
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: const Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedSearchField(),
        ),
      ),
      pinned: true,
    );
  }
}
