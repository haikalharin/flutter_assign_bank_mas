import 'package:flutter_assigment_bank_mas/data/models/landing_page_model/landing_page_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../models/response_model/response_model.dart';

class LandingPageApi with ApiHelper<LandingPageModel> {
  final DioClient dioClient;

  LandingPageApi({required this.dioClient});

  Future<ResponseModel<LandingPageModel>> getData() async {

    return await makeGetRequestWithResponseModel(
        dioClient.dio.get(
          ServiceUrl.landingPage,
        ),
        LandingPageModel.fromJson);
  }


}
