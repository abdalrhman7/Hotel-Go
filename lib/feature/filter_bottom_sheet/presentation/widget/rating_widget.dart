import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildRatingWidget(
          color: Colors.red,
          ratingNumber: 0,
        ),
        buildRatingWidget(
          color: Colors.orange,
          ratingNumber: 7,
        ),
        buildRatingWidget(
          color: Colors.green.shade600,
          ratingNumber: 7.5,
        ),
        buildRatingWidget(
          color: Colors.green.shade800,
          ratingNumber: 8,
        ),
        buildRatingWidget(
          color: AppColor.greenColor,
          ratingNumber: 8.5,
        ),
      ],
    );
  }

  Container buildRatingWidget({
    required Color color,
    required double ratingNumber,
  }) {
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
