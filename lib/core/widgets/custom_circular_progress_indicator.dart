import 'package:flutter/material.dart';


class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key, this.color,
  });

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: CircularProgressIndicator(),
    );
  }
}
