

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/feature/home/data/model/hotel_model.dart';

import '../../../../core/theme/text_style.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.hotel});

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(color: Colors.grey , width: 1.5),
      ),
      child: Padding(
        padding:  EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 26.h,
              width: 126.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: const Color(0xffC0DDE5),
              ),
              child: Center(
                child: Text('Our lowest price' , style: TextStyles.font16GreyW500),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                     style: const TextStyle(letterSpacing:-2),
                    children: <TextSpan>[
                      TextSpan(text: '\$', style: TextStyles.font28GreenW800),
                      TextSpan(text: '${hotel.price}' , style: TextStyles.font38GreenW800),
                    ],
                  ),
                ),
                const Spacer(),
                Text('View Deal' , style: TextStyles.font22Bold,),
                SizedBox(width: 4.w),
                const Icon(Icons.arrow_forward_ios_rounded , size: 22)
              ],
            ),
            Text('Renaissance' , style: TextStyles.font14),
          ],
        ),
      ),
    );
  }
}