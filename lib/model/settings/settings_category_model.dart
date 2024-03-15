import 'package:flutter/material.dart';

class SettingsCategoryModel {
  String categoryName;
  List<SettingsListModel> settingsList;

  SettingsCategoryModel({
    required this.categoryName,
    required this.settingsList,
  });
}

class SettingsListModel {
  String label;
  IconData icon;

  SettingsListModel({
    required this.label,
    required this.icon,
  });
}
