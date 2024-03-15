import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';

import '../../../../common/widgets/elevated_card.dart';
import '../../../../model/user/user_model.dart';
import '../logged_in_user_profile_card.dart';
import '../logged_out_user_profile_card.dart';

class SettingsScreenHeaderSliver extends StatelessWidget {
  const SettingsScreenHeaderSliver({
    super.key,
    required this.user,
  });

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      pinned: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      expandedHeight: 173 + kToolbarHeight + MediaQuery.of(context).padding.top,
      collapsedHeight:
          173 + kToolbarHeight + MediaQuery.of(context).padding.top,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Padding(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
              top: kToolbarHeight + MediaQuery.of(context).padding.top),
          child: ElevatedCard(
            padding: user == null
                ? const EdgeInsets.symmetric(horizontal: 25, vertical: 20)
                : EdgeInsets.zero,
            elevation: 5,
            child: user == null
                ? const LoggedOutUserProfileCard()
                : LoggedInUserProfileCard(
                    userName: user!.name,
                  ),
          ),
        ),
      ),
    );
  }
}
