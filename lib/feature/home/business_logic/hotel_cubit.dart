import 'package:bloc/bloc.dart';
import 'package:hotel_go/feature/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../data/model/hotel_model.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit(this.homeRepo) : super(HotelInitial());

  final HomeRepo homeRepo;

  int priceFilter = 540;
  bool isFilter = false;
  List<HotelModel> hotels = [];

  void getHotels() async {
    emit(GetHotelLoading());
    homeRepo.getHotels().then(
      (value) {
        hotels.addAll(value);
        emit(GetHotelSuccess(hotels));
      },
    ).catchError(
      (error) {
        emit(GetHotelError(error.toString()));
      },
    );
  }

  void getFiltersHotels() async {
    List<HotelModel> filterHotels = [];
    emit(GetHotelLoading());
    homeRepo.getHotels().then(
      (value) {
        isFilter = true;
        filterHotels.addAll(value.where((element) => element.price! < priceFilter));
        emit(GetFilterHotelSuccess(filterHotels));
      },
    ).catchError(
      (error) {
        emit(GetHotelError(error.toString()));
      },
    );
  }


  void cancelFilter() {
    isFilter = false;
    emit(GetHotelSuccess(hotels));
  }
}
