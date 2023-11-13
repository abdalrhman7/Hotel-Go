import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/feature/filter_bottom_sheet/presentation/widget/rating_widget.dart';
import 'package:hotel_go/feature/filter_bottom_sheet/presentation/widget/reset_filter_section.dart';
import 'package:hotel_go/feature/filter_bottom_sheet/presentation/widget/slider_widget.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../home/business_logic/hotel_cubit/hotel_cubit.dart';
import '../widget/build_star_container.dart';
import '../widget/price_per_night_widget.dart';

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
          const ResetFilterSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 26.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 PricePerNightWidget(cubit: cubit),
                SliderWidget(
                  price: cubit.priceFilter,
                  onChanged: (value) {
                    setState(() {
                      cubit.priceFilter = value;
                    });
                  },
                ),
                SizedBox(height: 24.h),
                buildHeadersText('rating'),
                SizedBox(height: 16.h),
                const RatingWidget(),
                SizedBox(height: 24.h),
                buildHeadersText('hotel class'),
                SizedBox(height: 16.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StarsRatingWidget(
                      numberOfStars: 1,
                    ),
                    StarsRatingWidget(
                      numberOfStars: 2,
                    ),
                    StarsRatingWidget(
                      numberOfStars: 3,
                    ),
                    StarsRatingWidget(
                      numberOfStars: 4,
                    ),
                    StarsRatingWidget(
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
