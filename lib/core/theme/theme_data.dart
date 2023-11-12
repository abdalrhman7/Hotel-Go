import 'package:flutter/material.dart';
import 'package:hotel_go/core/theme/app_color.dart';


ThemeData themeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.offWhiteColor,
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
