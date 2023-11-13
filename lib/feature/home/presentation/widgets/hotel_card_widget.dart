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
    return Stack(
      children: [
        Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.w)),
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
                    RatingAndDistanceWidget(hotel: hotel),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              PriceWidget(hotel: hotel),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.only(right: 32.w),
                child: Text(
                  'More price',
                  style: TextStyles.font16Gray.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        Positioned(
          top: 26,
          right: 26,
          child: Container(
            alignment: Alignment.center,
            height: 38.w,
            width: 38.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(128, 128, 128, 0.7),
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 28,
            ),
          ),
        )
      ],
    );
  }
}
