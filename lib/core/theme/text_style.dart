import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

TextStyle appStyle(
    {required double size, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
    fontSize: size.sp,
    color: color ?? Colors.black,
    fontWeight: fontWeight ?? FontWeight.normal,
    overflow: TextOverflow.ellipsis,
  );
}

class TextStyles {
  static final font14 = appStyle(size: 14);

  static final font16W500 = appStyle(
    size: 16,
    fontWeight: FontWeight.w500,
  );

  static final font16Gray = appStyle(
    size: 16,
    color: Colors.grey.shade700,
  );

  static final font14Grey = appStyle(
    size: 14,
    color: AppColor.greyColor,
  );

  static final font17WhiteBold = appStyle(
    size: 17,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final font20Bold = appStyle(
    size: 20,
    fontWeight: FontWeight.bold,
  );

  static final font16GreyW500 = appStyle(
    fontWeight: FontWeight.w500,
    size: 16,
    color: Colors.grey.shade800,
  );

  static final font22Bold = appStyle(
    size: 22,
    fontWeight: FontWeight.bold,
  );

  static final font18W500 = appStyle(
    size: 18,
    fontWeight: FontWeight.w500,
  );

  static final font28Bold = appStyle(
    size: 28,
    fontWeight: FontWeight.bold,
  );

  static final font28GreenW800 = appStyle(
    size: 28,
    color: AppColor.lightGreenColor,
    fontWeight: FontWeight.w800,
  );

  static final font38GreenW800 = appStyle(
    size: 38,
    color: AppColor.lightGreenColor,
    fontWeight: FontWeight.w800,
  );
}
