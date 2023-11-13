import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';
import '../../../home/business_logic/hotel_cubit/hotel_cubit.dart';

// ignore: must_be_immutable
class PricePerNightWidget extends StatelessWidget {
  PricePerNightWidget({super.key, required this.price, required this.onChanged, required this.cubit});
  int price;
  final ValueChanged<int> onChanged;
  final HotelCubit cubit ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price Per Night',
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
    ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor:  AppColor.brightWhiteColor,
            overlayColor: Colors.transparent,
            activeTrackColor:  AppColor.blueColor,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
          ),
          child: Slider(
            value: price.toDouble(),
            min: 20,
            max: 540,
            inactiveColor: const Color(0xFF8D8E98),
            onChanged: (double newValue) {
              price = newValue.round();
              onChanged(price);
            },
          ),
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
      ],
    );
  }
}