part of 'hotel_cubit.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}

class GetHotelLoading extends HotelState {}

class GetHotelSuccess extends HotelState {
  final List<HotelModel> hotels ;

  GetHotelSuccess(this.hotels);
}

class GetHotelError extends HotelState {
  final String errorMessage;

  GetHotelError(this.errorMessage);
}