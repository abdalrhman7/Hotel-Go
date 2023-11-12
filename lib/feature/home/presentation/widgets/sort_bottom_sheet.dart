import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
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
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.w),
                topRight: Radius.circular(16.w),
              ),
            ),
            child: Center(child: Text('Sort by', style: TextStyles.font18W500)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText('Our recommendations'),
                buildDividerWidget(),
                buildText('Ratting & Recommended'),
                buildDividerWidget(),
                buildText('Price & Recommended'),
                buildDividerWidget(),
                buildText('Distance & Recommended'),
                buildDividerWidget(),
                buildText('Rating only'),
                buildDividerWidget(),
                buildText('Price only'),
                buildDividerWidget(),
                buildText('Distance only'),
                buildDividerWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      style: TextStyles.font16ExtraGray,
    );
  }

  Divider buildDividerWidget() {
    return const Divider(
      thickness: 1.5,
      height: 32,
    );
  }
}
