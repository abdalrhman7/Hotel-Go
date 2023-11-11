import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/feature/home/data/model/hotel_model.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';

class RatingAndDistanceWidget extends StatelessWidget {
  const RatingAndDistanceWidget({
    super.key, required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24.h,
          width: 42.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: AppColor.greenColor
          ),
          child: Center(
            child: Text(
              '${hotel.reviewScore!}',
              style: TextStyles.font17WhiteBold,
            ),
          ),
        ),
        SizedBox(width: 6.w),
        Text(hotel.review! , style: TextStyles.font14Grey,),
        SizedBox(width: 4.w),
        const Icon(Icons.location_on , color: AppColor.greyColor , size: 16,),
        SizedBox(width: 4.w),
        Text(hotel.address!, style: TextStyles.font14Grey,),
      ],
    );
  }
}