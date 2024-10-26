import 'package:flutter/material.dart';

class MyTheme {
  static Color blackcolor = Color(0xff242424);
  static Color yellowcolor = Color(0xffFACC1D);
  static Color primarylight = Color(0xffB7935F);
  static Color primaryDark = Color(0xff141A2E);
  static Color white = Colors.white;

  static ThemeData lightmode = ThemeData(

      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primarylight,
      appBarTheme:
      AppBarTheme(iconTheme:IconThemeData(
          color: blackcolor
      ) ,
          color: Colors.transparent, elevation: 0, centerTitle: true),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 30,
          color: blackcolor,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: blackcolor,
        ),
        titleSmall:  TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: blackcolor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primarylight,
          unselectedItemColor: Colors.white,
          selectedItemColor: blackcolor,
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(size: 50),
          unselectedIconTheme: IconThemeData(size: 30),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
      cardTheme: CardTheme(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        elevation: 18,
      )
  );
  static ThemeData darktmode = ThemeData(

      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primaryDark,
      appBarTheme:
      AppBarTheme(iconTheme:IconThemeData(
          color: white
      ) ,
          color: Colors.transparent, elevation: 0, centerTitle: true),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 30,
          color: white,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: white,
        ),
        titleSmall:  TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: yellowcolor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryDark,
          unselectedItemColor: Colors.white,
          selectedItemColor: yellowcolor,
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(size: 50),
          unselectedIconTheme: IconThemeData(size: 30),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
      cardTheme: CardTheme(
        surfaceTintColor:primaryDark ,
        color: primaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        elevation: 18,
      )
  );
}
