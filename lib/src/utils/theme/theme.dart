import 'package:flutter/material.dart';

class CAppTheme {
  static ThemeData lighttheme=ThemeData(brightness: Brightness.light,
      primarySwatch:const MaterialColor(0xFF0E7999,<int,Color>{
        50:Color(0x1A0E7999),
        100:Color(0x330E7999),
        200:Color(0x4D0E7999),
        300:Color(0x660E7999),
        400:Color(0x800E7999),
        500: Color(0x990E7999),
        600:Color(0xB30E7999),
        700: Color(0xCC0E7999),
        800:Color(0xE60E7999),
        900:Color(0xFF0E7999),

      })
  );
      static ThemeData darktheme=ThemeData(brightness: Brightness.dark);
}