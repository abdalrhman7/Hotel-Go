
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../business_logic/hotel_cubit/hotel_cubit.dart';
import 'hotel_card_widget.dart';

class GetHotelBlocBuilder extends StatelessWidget {
  const GetHotelBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HotelCubit>(context);
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        if (state is GetHotelSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.hotels.length,
            itemBuilder: (context, index) {
              return HotelCardWidget(
                hotel: cubit.hotels[index],
              );
            },
          );
        }
        else if (state is GetFilterHotelSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.filterHotels.length,
            itemBuilder: (context, index) {
              return HotelCardWidget(
                hotel: state.filterHotels[index],
              );
            },
          );
        }else if (state is GetHotelError) {
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