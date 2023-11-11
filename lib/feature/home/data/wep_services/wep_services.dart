import 'package:dio/dio.dart';

class WebService {
  final Dio _dio;

  WebService(this._dio);

  Future<Response> getHotels({
    required String endPoint,
  }) async {
    Response response = await _dio.get(endPoint);
    return response;
  }
}
