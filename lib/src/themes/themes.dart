import 'package:flutter/material.dart';

class _AppThemes {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Color(0xffFAFAFA),
      iconTheme: IconThemeData(color: Colors.white30),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.white)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff222222),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryIconTheme: IconThemeData(color: Colors.black),
      primaryColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black38),
      tabBarTheme: TabBarTheme(
        labelColor: ThemeData.light().textTheme.bodyText1.color,
        indicator: UnderlineTabIndicator(borderSide: BorderSide()),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff222222),
      ),
    );
  }
}

final darkTheme = _AppThemes.darkTheme;
final lightTheme = _AppThemes.lightTheme;
