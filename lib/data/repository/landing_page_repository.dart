import 'package:dio/dio.dart';
import 'package:flutter_assigment_bank_mas/data/models/landing_page_model/landing_page_model.dart';
import 'package:flutter_assigment_bank_mas/data/remote_data_source/landing_page_api.dart';

import '../../../core/network/api_result.dart';
import '../../../core/network/dio_exception.dart';

import '../../common/exceptions/network_connection_exception.dart';
import '../../core/network/network_info.dart';
import '../../core/repository/repository_helper.dart';
import '../models/response_model/response_model.dart';

class LandingPageRepository with RepositoryHelper<LandingPageModel> {
  final NetworkInfoImpl networkInfo;
  final LandingPageApi agentDataApi;

  const LandingPageRepository({

    required this.agentDataApi,
    required this.networkInfo,
  });

  Future<ApiResult<ResponseModel<LandingPageModel>>> getData() async {
    try {
      if (await networkInfo.isConnected) {
        final ResponseModel<LandingPageModel> items =
        await agentDataApi.getData();
        return ApiResult.success(items);
      }else{
        return ApiResult.failure(NetworkConnectionException().message??'');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

}
