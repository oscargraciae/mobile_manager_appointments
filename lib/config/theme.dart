import 'package:flutter/material.dart';

const kTextColor = Color(0xFF020621);
const kTextSecondaryColor = Color(0xFF616161);

const kTextMediumColor = Color(0xFF53627C);
const kTextLightColor = Color(0xFFACB1C0);
const kPrimaryColor = Color(0xFF25CB67);
const kaccentColor = Color(0xFF3722d3);
const kBackgroundColor = Color(0xFFF6F7F9);
const kSurfaceColor = Color(0xFF020621);
const kBorderColor = Color(0xFFd9e3eb);
const kPrimaryLight = Color(0xFFE9F9EF);

final appTheme = ThemeData(
  primaryColor: kaccentColor,
  accentColor: kaccentColor,
  scaffoldBackgroundColor: kBackgroundColor,
  textTheme: TextTheme(
    headline1: TextStyle(color: kTextColor),
    headline2: TextStyle(color: kTextColor),
    headline3: TextStyle(color: kTextColor),
    headline4: TextStyle(color: kTextColor),
    headline5: TextStyle(color: kTextColor),
    subtitle1:  TextStyle(color: kTextColor),
    subtitle2:  TextStyle(color: kTextColor),
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
    // bodyText2: TextStyle().copyWith(color: Colors.blue),
  ),
);
