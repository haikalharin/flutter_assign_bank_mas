import 'package:fultter_assigment_bank_mas/core/network/api_config.dart';
import 'package:fultter_assigment_bank_mas/core/network/dio_interceptor.dart';
import 'package:dio/dio.dart' show Dio, ResponseType;


class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.headers = ApiConfig.header
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(DioInterceptor());
  }
}
