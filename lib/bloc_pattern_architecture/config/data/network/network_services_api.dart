import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloclabs/bloc_pattern_architecture/config/data/exceptions/app_exceptions.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesAPI extends BaseAPIServices {
  @override
  Future<dynamic> onDeleteAPI(String url) async {
    dynamic json_response;
    try {
      final response = await http.delete(Uri.parse(url)).timeout(const Duration(seconds: 60));
      json_response = onReturnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeoutException('');
    }
    return json_response;
  }

  @override
  Future<dynamic> onGetAPI(String url) async {
    dynamic json_response;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 60));
      json_response = onReturnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeoutException('');
    }
    return json_response;
  }

  @override
  Future<dynamic> onPostAPI(String url, data) async {
    dynamic json_response;
    try {
      final response = await http
          .post(Uri.parse(url), body: data, headers: {'x-api-key': 'reqres-free-v1'})
          .timeout(const Duration(seconds: 60));
      json_response = onReturnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeoutException('');
    }
    log("${json_response}", name: "Response");
    return json_response;
  }

  dynamic onReturnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic result = jsonDecode(response.body);
        return result;
      case 400:
        dynamic result = jsonDecode(response.body);
        return result;
      case 401:
        throw UnauthorizedException('');
      case 500:
        throw FetchDataException('Error communicating with server : ${response.statusCode}');
    }
  }
}
