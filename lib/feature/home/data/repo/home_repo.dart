import 'package:hotel_go/core/network/api_constants.dart';
import 'package:hotel_go/feature/home/data/wep_services/wep_services.dart';

import '../model/hotel_model.dart';

class HomeRepo {
  final WebService webService;

  HomeRepo(this.webService);

  Future<List<HotelModel>> getHotels() async {
    var response = await webService.getHotels(endPoint: ApiConstants.getHotels);
    return List<HotelModel>.from(
      (response.data as List).map(
        (e) => HotelModel.fromJson(e),
      ),
    );
  }

}
