import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/feature/home/presentation/widgets/sort_bottom_sheet.dart';

import '../../../../core/theme/app_color.dart';
import '../../business_logic/hotel_cubit/hotel_cubit.dart';
import '../../../filter_bottom_sheet/presentation/screen/filter_bottom_sheet.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HotelCubit>(context);
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
          color: AppColor.brightWhiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTextIconButton(
                'Filters', const Icon(Icons.filter_alt_outlined), () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                constraints: BoxConstraints(maxHeight: 0.8.sh),
                isScrollControlled: true,
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value: cubit,
                    child: const FilterBottomSheet(),
                  );
                },
              );
            }),
            _buildTextIconButton('sort', const Icon(Icons.sort), () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                constraints: BoxConstraints(maxHeight: 0.8.sh),
                isScrollControlled: true,
                context: context,
                builder: (_) {
                  return const SortBottomSheet();
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  TextButton _buildTextIconButton(
      String title, Icon icon, VoidCallback modelBottomSheet) {
    return TextButton.icon(
      onPressed: () {
        modelBottomSheet();
      },
      icon: icon,
      label: Text(title),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(AppColor.blueColor),
      ),
    );
  }
}
