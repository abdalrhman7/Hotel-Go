import 'package:dio/dio.dart';

import 'api_constants.dart';


class CreateAndSetupDio{
  final Dio dio;

  CreateAndSetupDio(this.dio);

  Dio createAndSetupDio()  {
    dio
      ..options.connectTimeout = const Duration(milliseconds: 200 * 1000)
      ..options.receiveTimeout = const Duration(milliseconds: 200 * 1000);
    dio.options.baseUrl = ApiConstants.baseUrl;

    dio.interceptors.add(LogInterceptor(
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
    return dio;
  }
}


