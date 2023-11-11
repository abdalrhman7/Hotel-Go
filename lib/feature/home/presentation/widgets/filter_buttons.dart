import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/feature/home/presentation/widgets/sort_by_bottom_sheet.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';
import 'filter_bottom_sheet.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        height: 0.08.sh,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          color: Color(0xffFFFFFF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  constraints: BoxConstraints(maxHeight: 0.8.sh),
                  isScrollControlled: true,
                  context: context,
                  builder: (_) {
                    return const FilterBottomSheet();
                  },
                );
              },
              icon: const Icon(Icons.filter_alt_outlined),
              label:  const Text('Filters'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(AppColor.blueColor),              ),
            ),
            TextButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  constraints: BoxConstraints(maxHeight: 0.8.sh),
                  isScrollControlled: true,
                  context: context,
                  builder: (_) {
                    return const SortBottomSheet();
                  },
                );
              },
              icon: const Icon(Icons.sort),
              label: const Text('Sort'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(AppColor.blueColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


