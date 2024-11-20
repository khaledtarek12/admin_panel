import 'package:flutter/material.dart';

import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/theme/custom/appbar_theme.dart';
import 'package:t_store_web_adimn/utils/theme/custom/bottom_sheet_theme.dart';
import 'package:t_store_web_adimn/utils/theme/custom/checkbox_theme.dart';
import 'package:t_store_web_adimn/utils/theme/custom/chip_theme.dart';
import 'package:t_store_web_adimn/utils/theme/custom/elevated_button_theme.dart';
import 'package:t_store_web_adimn/utils/theme/custom/outlined_button_theme.dart';
import 'package:t_store_web_adimn/utils/theme/custom/text_field_theme.dart';
import 'package:t_store_web_adimn/utils/theme/custom/text_themes.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: TColors.softGrey,
    textTheme: TTextThemes.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppbarTheme.lightAppbarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: TColors.black.withOpacity(0.9),
    textTheme: TTextThemes.dartTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppbarTheme.darkAppbarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
  );
}
