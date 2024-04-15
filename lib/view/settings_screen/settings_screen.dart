import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/elevated_card.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/controller/settings/settings_screen_controller.dart';
import 'package:flutter_zomato_clone/model/user/user_model.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/utils/functions/custom_functions.dart';
import 'package:flutter_zomato_clone/utils/functions/shared_preferences_utils.dart';
import 'package:flutter_zomato_clone/view/splash_screen/splash_screen.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../model/settings/settings_category_model.dart';
import 'widgets/slivers/settings_screen_header_sliver.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  UserModel? user;
  List<SettingsCategoryModel> settingsModelList = [];
  @override
  void initState() {
    getSettings();
    super.initState();
  }

  void getSettings() async {
    user = await SharedPreferencesUtils.getLoginedUser();
    log('loggined user:\n\n ${user != null}');
    settingsModelList = SettingsScreenController.getSettingsCategoryList(user);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SettingsScreenHeaderSliver(user: user),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            sliver: SliverGrid.builder(
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 16 / 9,
              ),
              itemBuilder: (context, index) => ElevatedCard(
                elevation: 1,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorConstants.black3c.withOpacity(0.1),
                      child: Icon(
                        index == 0
                            ? EvaIcons.heart_outline
                            : Icons.currency_rupee_rounded,
                        color: ColorConstants.primaryBlack,
                      ),
                    ),
                    kVSpace(15),
                    Text(
                      index == 0 ? 'Favourites' : 'Money',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
              bottom: 250,
            ),
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                SettingsCategoryModel categoryItem = settingsModelList[index];
                List<SettingsListModel> settingsList =
                    categoryItem.settingsList;
                return ElevatedCard(
                  elevation: 1,
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 2.5,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: ColorConstants.primaryColor,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(4),
                                ),
                              ),
                            ),
                            kHSpace(10),
                            Text(
                              categoryItem.categoryName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.titleMedium!,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            SettingsListModel settingsItem =
                                settingsList[index];
                            return InkWell(
                              onTap: () async {
                                if (settingsItem.label == 'Log out') {
                                  showMyDialog(
                                    context: context,
                                    content: Row(
                                      children: [
                                        const CircularProgressIndicator(),
                                        kHSpace(10),
                                        const Text('Logging out...'),
                                      ],
                                    ),
                                  );
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  if (await SharedPreferencesUtils
                                      .removeUserCredentials()) {
                                    if (!context.mounted) {
                                      return;
                                    }
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SplashScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: ColorConstants.black3c
                                          .withOpacity(0.1),
                                      foregroundColor: ColorConstants.black3c
                                          .withOpacity(0.35),
                                      child: Icon(
                                        settingsItem.icon,
                                        size: 20,
                                      ),
                                    ),
                                    kHSpace(10),
                                    Text(
                                      settingsItem.label,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 1,
                              thickness: 0.5,
                              color: ColorConstants.black3c.withOpacity(0.12),
                              indent: 55,
                            );
                          },
                          itemCount: settingsList.length,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return kVSpace(15);
              },
              itemCount: settingsModelList.length,
            ),
          ),
        ],
      ),
    );
  }
}
