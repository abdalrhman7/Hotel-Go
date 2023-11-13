import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_go/feature/home/business_logic/filter_buttons_visibility_cubit/filter_buttons_visibility_cubit.dart';

import '../widgets/filter_buttons.dart';
import '../widgets/get_hotel_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //show and hide filters button
        child: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            if (notification.depth == 0 &&
                notification.metrics.axis == Axis.vertical) {
              if (notification.metrics.pixels > 0) {
                context
                    .read<FilterButtonsVisibilityCubit>()
                    .hideFilterButtons();
              } else if (notification.metrics.pixels <= 0) {
                context
                    .read<FilterButtonsVisibilityCubit>()
                    .showFilterButtons();
              }
            }
            return false;
          },
          child: Stack(
            children: [
              const GetHotelBlocBuilder(),
              BlocBuilder<FilterButtonsVisibilityCubit, bool>(
                builder: (context, showFilterButtons) {
                  return showFilterButtons
                      ? const FilterButtons()
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
