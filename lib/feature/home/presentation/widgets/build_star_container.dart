import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/core/theme/app_color.dart';

class BuildStarContainer extends StatelessWidget {
  const BuildStarContainer({super.key, required this.numberOfStars});

  final int numberOfStars;

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 0; i < numberOfStars; i++) {
      stars.add(
        const Icon(
          Icons.star,
          size: 16,
          color: AppColor.orangeColor,
        ),
      );
    }

    return Container(
      height: 46.h,
      width: 46.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.orangeColor),
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (numberOfStars == 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: stars,
              ),
            if (numberOfStars == 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  stars[0],
                  stars[1],
                ],
              ),
            if (numberOfStars == 3)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [stars[0]],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      stars[1],
                      stars[2],
                    ],
                  ),
                ],
              ),
            if (numberOfStars == 4)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [stars[0], stars[1]],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [stars[2], stars[3]],
                  ),
                ],
              ),
            if (numberOfStars == 5)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [stars[0], stars[1]],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [stars[2]],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [stars[3], stars[4]],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
