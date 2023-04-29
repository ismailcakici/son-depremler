import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance!;
  }

  ColorSchemeLight._init();

  final Brightness brightnessLight = Brightness.light;
  final SystemUiOverlayStyle systemUiOverlayStyleLight =
      SystemUiOverlayStyle.light;

  final Color white = const Color(0xffF0F5F9);
  final Color grey = const Color(0xffC9D6DF);
  final Color darkGrey = const Color(0xff52616B);
  final Color black = const Color(0xff1E2022);
  final Color red = const Color(0xffEA5455);
  final Color transparent = Colors.transparent;
}
