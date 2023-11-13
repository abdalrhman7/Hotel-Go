

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';
import '../../../home/business_logic/hotel_cubit/hotel_cubit.dart';

class ResetFilterSection extends StatelessWidget {
  const ResetFilterSection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HotelCubit>(context);
    return Container(
      height: 44.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.brightWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cubit.isFilter
                ? GestureDetector(
              child: Text(
                'Reset',
                style: TextStyles.font18Grey
                    .copyWith(decoration: TextDecoration.underline , color: AppColor.blueColor),
              ),
              onTap: () {
                cubit.cancelFilter();
                Navigator.pop(context);
              },
            )
                : Text(
              'Reset',
              style: TextStyles.font18Grey
                  .copyWith(decoration: TextDecoration.underline),
            ),
            Text('Filters', style: TextStyles.font18W500),
            IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }
}