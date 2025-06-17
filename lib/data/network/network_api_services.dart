import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:stylish/data/app_exception.dart';
import 'package:stylish/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

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
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 30));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExcaption('');
    } on TimeoutException {
      throw RequestTimeout('');
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
        return responsejson;

      case 400:
        throw InvalidUrl('');

      default:
        throw FetchDataExcaption('An Error Ocured With Comunication' +
            response.statusCode.toString());
    }
  }
}
