import 'package:flutter/material.dart';


ThemeData themeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    primaryColor: Colors.redAccent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );
}
