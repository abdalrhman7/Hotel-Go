

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          5,
              (index) => Icon(
            Icons.star,
            size: 16,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(width: 4.w),
        Text('Hotel', style: TextStyles.font16Gray)
      ],
    );
  }
}