

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';
import '../../../home/business_logic/hotel_cubit/hotel_cubit.dart';

class PricePerNightWidget extends StatelessWidget {
  const PricePerNightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HotelCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'price per night',
          style: TextStyles.font14W600,
        ),
        Container(
          alignment: Alignment.center,
          height: 44.h,
          width: 68.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(4.w),
          ),
          child: Text(
            '${cubit.priceFilter}+ \$',
            style: TextStyles.font16W400,
          ),
        ),
      ],
    );
  }
}