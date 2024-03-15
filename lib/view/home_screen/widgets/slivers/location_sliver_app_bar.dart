import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/view/settings_screen/settings_screen.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/spacer.dart';
import '../../../../common/widgets/user_circle_avatar.dart';
import '../../../../model/user/user_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/functions/shared_preferences_utils.dart';
import '../elevated_search_field.dart';

class LocationSliverAppBar extends StatefulWidget {
  const LocationSliverAppBar({super.key});

  @override
  State<LocationSliverAppBar> createState() => _LocationSliverAppBarState();
}

class _LocationSliverAppBarState extends State<LocationSliverAppBar> {
  final double elevatedSearchFieldHeight = 55;
  UserModel? user;

  @override
  void initState() {
    getLoginedUser();
    super.initState();
  }

  void getLoginedUser() async {
    user = await SharedPreferencesUtils.getLoginedUser();
    if (user != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: false,
      surfaceTintColor: Colors.transparent,
      expandedHeight: kTextTabBarHeight +
          elevatedSearchFieldHeight +
          MediaQuery.of(context).padding.top,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1,
        background: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
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
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                ),
                child: user == null
                    ? const Icon(
                        Icons.menu,
                        color: ColorConstants.primaryBlack,
                      )
                    : UserCircleAvatar(userName: user!.name),
              ),
            ],
          ),
        ),
      ),
      collapsedHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: ElevatedSearchField(),
      ),
      pinned: true,
    );
  }
}
