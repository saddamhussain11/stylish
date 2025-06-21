import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:stylish/data/app_exception.dart';
import 'package:stylish/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/res/app_url/api_url.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExcaption('');
    } on TimeoutException {
      throw RequestTimeout('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, var data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {ApiUrl.apikey: ApiUrl.apikeyValue},
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExcaption('');
    } on TimeoutException {
      throw RequestTimeout('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPutApiResponse(String url, dynamic data) {
    // Implementation for PUT request
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getDeleteApiResponse(String url) {
    // Implementation for DELETE request
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        final token = responsejson['token'];
        if (kDebugMode) {
          print('Response Token: $token');
        }
        return responsejson;
      case 400:
        throw InvalidUrl;
      default:
        throw FetchDataExcaption('An Error Ocured With Comunication' +
            response.statusCode.toString());
    }
  }
}
