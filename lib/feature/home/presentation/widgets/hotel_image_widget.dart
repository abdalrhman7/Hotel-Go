import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelImageWidget extends StatelessWidget {
  const HotelImageWidget({

    super.key, required this.imgUrl,
  });

  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft:Radius.circular(12.w)  , topRight: Radius.circular(12.w)),
      child: SizedBox(
        height: 0.22.sh,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.w),
              topRight: Radius.circular(12.w)),
          child: FancyShimmerImage(
            width: double.infinity,
            errorWidget: const Icon(Icons.error),
            imageUrl: imgUrl,
            boxFit: BoxFit.fill,
          ),
        ),
      ),

    );
  }
}