import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';


// ignore: must_be_immutable
class SliderWidget extends StatelessWidget {
  SliderWidget({super.key, required this.price, required this.onChanged});
  int price;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbColor: const Color(0xffFFFFFF),
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
    );
  }
}