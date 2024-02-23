import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../core/network/dio_exception.dart';
import '../core/network/http_constants.dart';

class HttpUtil {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return contentType == HttpConstants.jsonContentType
        ? utf8.encode(json.encode(data))
        : data;
  }

  static dynamic getResponse(Response response) {
    if (kDebugMode) {
      print('>>>>>>> ${response.data}');
    }
    switch (response.statusCode) {
      case 200:
        return _getSuccessResponse(response);
      default:
        throw DioExceptions;
    }
  }

  static dynamic _getSuccessResponse(Response response) {
    final responseJson = response.data;
    dynamic data = responseJson;
    String dataString = responseJson.toString().substring(1, 70); // 'art'
    if (kDebugMode) {
      print('>>>>>>> [RESPONSE] $responseJson');
    }
    if (!dataString.contains('"data":')) {
      data = {'data': responseJson ?? ''};
    }
    return data;
  }

  static dynamic _tokenExpired(Response response) {
    final responseJson = json.decode(response.data);

    if (kDebugMode) {
      print('>>>>>>> [Token Expired Response] $responseJson');
    }
    // AppSharedPreference.clear();
    //FIX SCREEN ONBOARDING MENUMPUK SAAT SESSION EXPIRED
    // navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const LoginPage(tokenExpired: true,)), (route) => false);
    //navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen(isHavePopUpMessage: "401",)));
    return responseJson;
  }
}
