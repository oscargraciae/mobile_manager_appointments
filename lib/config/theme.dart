import 'package:flutter/material.dart';

const kTextColor = Color(0xFF020621);
const kTextSecondaryColor = Color(0xFF616161);

const kTextMediumColor = Color(0xFF53627C);
const kTextLightColor = Color(0xFFACB1C0);
const kPrimaryColor = Color(0xFF25CB67);
// const kaccentColor = Color(0xFF3722d3);
const kaccentColor = Color(0xFF000000);
const kBackgroundColor = Color(0xFFFFFFFF);
const kSurfaceColor = Color(0xFF020621);
const kBorderColor = Color(0xFFd9e3eb);
const kPrimaryLight = Color(0xFFE9F9EF);
const kInputColor = Color(0xFFf6f8fa);

final appTheme = ThemeData(
  fontFamily: 'Nunito',
  textSelectionTheme: TextSelectionThemeData(
    // cursorColor: Colors.yellow,
    // selectionColor: Colors.green,
    // selectionHandleColor: Colors.yellow,
  ),
  primarySwatch: Colors.green,
  primaryColor: kaccentColor,
  primaryColorDark: kaccentColor,
  primaryColorLight: kaccentColor,
  hintColor: Colors.pink,
  focusColor: Colors.yellow,
  selectedRowColor: Colors.green,
  disabledColor: Colors.brown,
  accentColor: kaccentColor,
  scaffoldBackgroundColor: kBackgroundColor,
  indicatorColor: Colors.amber,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black),
  ),
  accentTextTheme: TextTheme(
    headline1: TextStyle(color: kTextColor),
    headline2: TextStyle(color: kTextColor),
    headline3: TextStyle(color: kTextColor),
    headline4: TextStyle(color: kTextColor),
    headline5: TextStyle(color: kTextColor),
    headline6: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  primaryTextTheme: TextTheme(
    headline1: TextStyle(color: kTextColor),
    headline2: TextStyle(color: kTextColor),
    headline3: TextStyle(color: kTextColor),
    headline4: TextStyle(color: kTextColor),
    headline5: TextStyle(color: kTextColor),
    headline6: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kPrimaryLight,
    iconTheme: IconThemeData(color: Colors.black),
    brightness: Brightness.light,
    elevation: 0,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(color: kTextColor),
    headline2: TextStyle(color: kTextColor),
    headline3: TextStyle(color: kTextColor),
    headline4: TextStyle(color: kTextColor),
    headline5: TextStyle(color: kTextColor),
    headline6: TextStyle(color: kTextColor),
    subtitle1:  TextStyle(color: kTextColor),
    subtitle2:  TextStyle(color: kTextColor),
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
    // bodyText2: TextStyle().copyWith(color: Colors.blue),
  ),
);
