import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/feature/home/business_logic/hotel_cubit.dart';
import 'package:hotel_go/feature/home/presentation/widgets/rating_widget.dart';
import 'package:hotel_go/feature/home/presentation/widgets/slider_widget.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widgets/main_button.dart';
import 'build_star_container.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HotelCubit>(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColor.offWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Column(
        children: [
          Container(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 26.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildHeadersText('price per night'),
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
                ),
                SliderWidget(
                  price: cubit.priceFilter,
                  onChanged: (value) {
                    setState(() {
                      cubit.priceFilter = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$20',
                        style: TextStyles.font16Grey,
                      ),
                      Text(
                        '\$540+',
                        style: TextStyles.font16Grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                buildHeadersText('rating'),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RatingWidget(
                      color: Colors.red,
                      ratingNumber: 0,
                    ),
                    const RatingWidget(
                      color: Colors.orange,
                      ratingNumber: 7,
                    ),
                    RatingWidget(
                      color: Colors.green.shade600,
                      ratingNumber: 7.5,
                    ),
                    RatingWidget(
                      color: Colors.green.shade800,
                      ratingNumber: 8,
                    ),
                    const RatingWidget(
                      color: AppColor.greenColor,
                      ratingNumber: 8.5,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                buildHeadersText('hotel class'),
                SizedBox(height: 16.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildStarContainer(
                      numberOfStars: 1,
                    ),
                    BuildStarContainer(
                      numberOfStars: 2,
                    ),
                    BuildStarContainer(
                      numberOfStars: 3,
                    ),
                    BuildStarContainer(
                      numberOfStars: 4,
                    ),
                    BuildStarContainer(
                      numberOfStars: 5,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                buildHeadersText('Distance from'),
                const Divider(
                  height: 40,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text(
                      'Location',
                      style: TextStyles.font16Grey,
                    ),
                    const Spacer(),
                    Text(
                      'City center',
                      style: TextStyles.font16Grey,
                    ),
                    SizedBox(width: 12.w),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.greyColor,
                      size: 18,
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                MainButton(
                  onTap: () {
                    cubit.getFiltersHotels();
                    Navigator.pop(context);
                  },
                  text: 'Show result',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Text buildHeadersText(String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyles.font14W600,
    );
  }
}
