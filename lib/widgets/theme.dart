import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          // color: Colors.white,
          elevation: 0.0,
          color: Theme.of(context).colorScheme.surface,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      );

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}
