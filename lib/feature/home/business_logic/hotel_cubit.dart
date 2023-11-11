import 'package:bloc/bloc.dart';
import 'package:hotel_go/feature/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../data/model/hotel_model.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit(this.homeRepo) : super(HotelInitial());

  final HomeRepo homeRepo;

  void getHotels() async {
    emit(GetHotelLoading());

    homeRepo
        .getHotels()
        .then(
          (value) => emit(GetHotelSuccess(value)),
        )
        .catchError(
          (error) => emit(GetHotelError(error.toString())),
        );
  }
}
