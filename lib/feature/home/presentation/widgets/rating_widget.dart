import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.color, required this.ratingNumber});

  final Color color ;
  final double ratingNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 32.h,
      width: 36.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        color: color,
      ),
      child: Text(
        '$ratingNumber+',
        style: TextStyles.font14WhiteW500,
      ),
    );
  }
}