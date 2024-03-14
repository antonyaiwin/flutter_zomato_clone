import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();
  static const BottomSheetThemeData _baseBottomSheetTheme =
      BottomSheetThemeData();

  static BottomSheetThemeData lightTextTheme = _baseBottomSheetTheme.copyWith(
    backgroundColor: ColorConstants
        .scaffoldBackgroundColor /* const Color.fromRGBO(245, 246, 251, 1) */,
  );

  static BottomSheetThemeData darkTextTheme = _baseBottomSheetTheme.copyWith(
    backgroundColor: ColorConstants.black3c,
  );
}
