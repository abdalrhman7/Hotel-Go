import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_go/feature/home/data/repo/home_repo.dart';
import '../network/setup_dio.dart';
import '../../feature/home/business_logic/hotel_cubit/hotel_cubit.dart';
import '../../feature/home/data/wep_services/wep_services.dart';

final getIt = GetIt.instance;

void initGetIt() async {

  ///Bloc
  getIt.registerLazySingleton<HotelCubit>(() => HotelCubit(getIt()));

  /// Repo
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  ///Wep_Services
  getIt.registerLazySingleton<WebService>(
      () => WebService(CreateAndSetupDio(getIt()).createAndSetupDio()));

  getIt.registerSingleton<Dio>(Dio());

  ///Local_data
}
