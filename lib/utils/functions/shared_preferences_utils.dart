import 'dart:developer';

import 'package:flutter_zomato_clone/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesUtils {
  static const String _userNameKey = 'user_name',
      _userEmailKey = 'email',
      _userPhoneNoKey = 'phone_no',
      _userIsVegetarianKey = 'is_vegetarian';

  static Future<bool> saveLoginCredentials(UserModel user) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(_userNameKey, user.name);
    await prefs.setString(_userEmailKey, user.email ?? '');
    await prefs.setString(_userPhoneNoKey, user.phoneNo);
    await prefs.setBool(_userIsVegetarianKey, user.isVegetarian);
    return true;
  }

  static Future<UserModel?> getLoginedUser() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('Pref: \n\n ${prefs.containsKey(_userNameKey)} && ${prefs.containsKey(_userPhoneNoKey)} && ${prefs.containsKey(_userIsVegetarianKey)}');
    if (prefs.containsKey(_userNameKey) &&
        prefs.containsKey(_userPhoneNoKey) &&
        prefs.containsKey(_userIsVegetarianKey)) {
      return UserModel(
        name: prefs.getString(_userNameKey)!,
        email: prefs.getString(_userEmailKey),
        phoneNo: prefs.getString(_userPhoneNoKey)!,
        isVegetarian: prefs.getBool(_userIsVegetarianKey)!,
      );
    }
    return null;
  }

  static Future<bool> removeUserCredentials() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(_userNameKey);
      await prefs.remove(_userEmailKey);
      await prefs.remove(_userPhoneNoKey);
      await prefs.remove(_userIsVegetarianKey);
      return true;
    } on Exception {
      return false;
    }
  }
}
