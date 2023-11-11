import 'package:flutter/material.dart';
import 'package:hotel_go/feature/home/data/repo/home_repo.dart';
import 'package:hotel_go/feature/home/presentation/screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/business_logic/hotel_cubit.dart';
import '../../feature/splash/presentation/screen/splash_screen.dart';
import '../../injection.dart';

class AppRoutes {
  static const String slashScreen = '/';
  static const String homeScreen = '/onBoarding_view';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HotelCubit>(
            create: (context) => HotelCubit(getIt.get<HomeRepo>())..getHotels(),
            child:  const HomeScreen(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
