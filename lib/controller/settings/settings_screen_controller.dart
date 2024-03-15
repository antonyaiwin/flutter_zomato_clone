import 'package:flutter_zomato_clone/model/user/user_model.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../model/settings/settings_category_model.dart';

abstract class SettingsScreenController {
  static List<SettingsCategoryModel> getSettingsCategoryList(UserModel? user) {
    List<SettingsCategoryModel> list = [];
    list.addAll(_DummyData.settingsModelList);
    if (user == null) {
      list.last.settingsList.removeLast();
    }
    return list;
  }
}

abstract class _DummyData {
  static final List<SettingsCategoryModel> settingsModelList = [
    SettingsCategoryModel(
      categoryName: 'Food orders',
      settingsList: [
        SettingsListModel(
          label: 'Your orders',
          icon: Iconsax.bag_2_outline,
        ),
        SettingsListModel(
          label: 'Favorite orders',
          icon: Clarity.heart_line,
        ),
        SettingsListModel(
          label: 'Address book',
          icon: Clarity.book_line,
        ),
        SettingsListModel(
          label: 'Hidden Restaurants',
          icon: Clarity.eye_hide_line,
        ),
        SettingsListModel(
          label: 'Online ordering help',
          icon: Clarity.talk_bubbles_line,
        ),
      ],
    ),
    SettingsCategoryModel(
      categoryName: 'Zomato For Enterprise',
      settingsList: [
        SettingsListModel(
          label: 'For employers',
          icon: Clarity.building_line,
        ),
        SettingsListModel(
          label: 'For employees',
          icon: Clarity.employee_line,
        ),
      ],
    ),
    SettingsCategoryModel(
      categoryName: 'More',
      settingsList: [
        SettingsListModel(
          label: 'About',
          icon: Clarity.info_standard_line,
        ),
        SettingsListModel(
          label: 'Send feedback',
          icon: Clarity.form_line,
        ),
        SettingsListModel(
          label: 'Report a safety emergency',
          icon: Clarity.error_standard_line,
        ),
        SettingsListModel(
          label: 'Settings',
          icon: Clarity.settings_line,
        ),
        SettingsListModel(
          label: 'Log out',
          icon: Clarity.power_line,
        ),
      ],
    ),
  ];
}
