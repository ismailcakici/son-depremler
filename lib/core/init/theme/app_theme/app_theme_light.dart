import 'package:flutter/material.dart';
import 'package:son_depremler/core/constants/app/app_constants.dart';
import 'package:son_depremler/core/init/theme/app_theme/app_theme.dart';
import 'package:son_depremler/core/init/theme/color_scheme/i_color_scheme_light.dart';

class AppThemeLight extends AppTheme with IColorSchemeLight {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get appThemeLight => ThemeData(
        useMaterial3: true,
        fontFamily: AppConstants.fontFamily,
        appBarTheme: _appBarTheme,
        colorScheme: _colorScheme,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: colorSchemeLight!.transparent,
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
      );

  ColorScheme get _colorScheme => ColorScheme(
        brightness: colorSchemeLight!.brightnessLight,
        primary: colorSchemeLight!.darkGrey,
        onPrimary: colorSchemeLight!.white,
        secondary: colorSchemeLight!.red,
        onSecondary: colorSchemeLight!.white,
        error: colorSchemeLight!.red,
        onError: colorSchemeLight!.white,
        background: colorSchemeLight!.white,
        onBackground: colorSchemeLight!.darkGrey,
        surface: colorSchemeLight!.white,
        onSurface: colorSchemeLight!.darkGrey,
      );
}
