import 'package:flutter/material.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static final ThemeData _baseTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.redAccent,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
  );

  static ThemeData lightTheme = _baseTheme.copyWith(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = _baseTheme.copyWith(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    scaffoldBackgroundColor: Colors.black,
  );
}
