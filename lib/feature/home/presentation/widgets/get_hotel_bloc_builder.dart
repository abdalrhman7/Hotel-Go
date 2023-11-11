
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../business_logic/hotel_cubit.dart';
import 'hotel_card_widget.dart';

class GetHotelBlocBuilder extends StatelessWidget {
  const GetHotelBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        if (state is GetHotelSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.hotels.length,
            itemBuilder: (context, index) {
              return HotelCardWidget(
                hotel: state.hotels[index],
              );
            },
          );
        } else if (state is GetHotelError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetHotelError) {

          return  Center(child: Text(state.errorMessage.toString()),);
        }
        else{
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}