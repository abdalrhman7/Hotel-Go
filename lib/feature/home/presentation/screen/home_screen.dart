import 'package:flutter/material.dart';

import '../widgets/filter_buttons.dart';
import '../widgets/get_hotel_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GetHotelBlocBuilder(),
            FilterButtons(),
          ],
        ),
      ),
    );
  }
}


