import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_go/feature/home/data/wep_services/wep_services.dart';

import 'core/app_route/router.dart';
import 'core/theme/theme_data.dart';
import 'feature/home/data/repo/home_repo.dart';
import 'core/DI/injection.dart';

void main() {

  initGetIt();
  HomeRepo homeRepo = HomeRepo(getIt.get<WebService>());
  homeRepo.getHotels();
  runApp(const HotelGo());
}

class HotelGo extends StatelessWidget {
  const HotelGo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(context),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

