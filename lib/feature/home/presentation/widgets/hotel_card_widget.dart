import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/feature/home/data/model/hotel_model.dart';
import 'package:hotel_go/feature/home/presentation/widgets/price_widget.dart';
import 'package:hotel_go/feature/home/presentation/widgets/rating_and_distance_widget.dart';
import 'package:hotel_go/feature/home/presentation/widgets/rating_bar_widget.dart';

import '../../../../core/theme/text_style.dart';
import 'hotel_image_widget.dart';

class HotelCardWidget extends StatelessWidget {
  const HotelCardWidget({super.key, required this.hotel});

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.w)),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           HotelImageWidget(imgUrl: hotel.image!),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RatingBarWidget(),
                SizedBox(height: 6.h),
                Text(
                  hotel.name!,
                  style: TextStyles.font20Bold,
                ),
                SizedBox(height: 6.h),
                 RatingAndDistanceWidget(hotel:  hotel),
              ],
            ),
          ),
          SizedBox(height: 4.h),
           PriceWidget(hotel: hotel),
          SizedBox(height: 6.h),
          Padding(
            padding:  EdgeInsets.only(right: 32.w),
            child: Text('More price' , style: TextStyles.font16Gray.copyWith(decoration: TextDecoration.underline,), ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
