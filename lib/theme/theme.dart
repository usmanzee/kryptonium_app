import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorStyle {
  static const primaryColor = Color(0xFFF0B255);
  static const secondaryColor = Color(0xFFF458B6);
  static const backgroudColor = Color(0xFF171336);
  static const lightBackgroudColor = Color(0xFF1F1A3E);

  static const selectionColor = Color(0xFFFFFFFF);
  static const hintColor = Color(0xFF707377);
  static const highlightColor = Color(0xFFBFBFBF);
  static const cardColor = Colors.white;
}

class Themes {
  static final theme = ThemeData(
    scaffoldBackgroundColor: ColorStyle.lightBackgroudColor,
    canvasColor: ColorStyle.backgroudColor,
    primaryColor: ColorStyle.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ColorStyle.secondaryColor, brightness: Brightness.dark),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: ColorStyle.selectionColor,
            fontSize: 18,
            fontWeight: FontWeight.w700),
        iconTheme: IconThemeData(
          color: ColorStyle.selectionColor,
        ),
        backgroundColor: ColorStyle.backgroudColor,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    textSelectionTheme: const TextSelectionThemeData(
        selectionColor: ColorStyle.selectionColor,
        selectionHandleColor: ColorStyle.hintColor),
    dividerColor: ColorStyle.highlightColor,
    highlightColor: ColorStyle.highlightColor,
    hintColor: ColorStyle.hintColor,
    fontFamily: "nexa-light",
    // textTheme: const TextTheme(
    //   bodyText1: TextStyle(
    //       fontSize: 18.0, fontFamily: 'nexa_light', color: Color(0xFF000000)),
    //   bodyText2: TextStyle(
    //       fontSize: 16.0, fontFamily: 'nexa_light', color: Color(0xFF000000)),
    //   button: TextStyle(
    //       fontSize: 18.0,
    //       fontFamily: 'nexa_light',
    //       fontWeight: FontWeight.bold,
    //       color: Color(0xFF000000)),
    //   subtitle1: TextStyle(
    //       fontSize: 10.0,
    //       fontFamily: 'nexa_light',
    //       height: 12,
    //       color: Color(0xFF000000)),
    //   subtitle2: TextStyle(
    //       fontSize: 8.0, fontFamily: 'nexa_light', color: Color(0xFF000000)),
    //   caption: TextStyle(
    //       fontSize: 12.0, fontFamily: 'nexa_light', color: Color(0xFF000000)),
    // ),
  );
}
