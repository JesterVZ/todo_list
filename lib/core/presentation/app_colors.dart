import 'package:flutter/material.dart';

class AppColors {
  static const transparent = Colors.transparent;
  static const backgroundColor = Color(0xFF050D3B);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;

  static const gray1 = Color(0xFFB5C0FF);
  static const gray2 = Color(0xffC9C9C9);

  static const MaterialColor appcolor =
      MaterialColor(_appcolorPrimaryValue, <int, Color>{
    50: Color(0xFFF2E9F9),
    100: Color(0xFFDEC8EF),
    200: Color(0xFFC8A4E5),
    300: Color(0xFFB180DA),
    400: Color(0xFFA164D2),
    500: Color(_appcolorPrimaryValue),
    600: Color(0xFF8842C5),
    700: Color(0xFF7D39BD),
    800: Color(0xFF7331B7),
    900: Color(0xFF6121AB),
  });
  static const int _appcolorPrimaryValue = 0xFF9049CA;

  static const MaterialColor appcolorAccent =
      MaterialColor(_appcolorAccentValue, <int, Color>{
    100: Color(0xFFF1E5FF),
    200: Color(_appcolorAccentValue),
    400: Color(0xFFB780FF),
    700: Color(0xFFA966FF),
  });
  static const int _appcolorAccentValue = 0xFFD4B3FF;

  static const redColor = Color(0xFFFF0000);

  static const greenColor = Color(0xFF00FF38);

  static const blueColor = Color(0xFF0085FF);
}
