import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'text_theme.dart';

class TElevatedButtonTheme {
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: ColorConstants.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TTextTheme.baseTextTheme.labelLarge!.copyWith(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: ColorConstants.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TTextTheme.baseTextTheme.labelLarge!.copyWith(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}
