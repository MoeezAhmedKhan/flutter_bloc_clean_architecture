import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_clean_architecture/utils/data/exception/app_exception.dart';
import 'package:flutter_bloc_clean_architecture/utils/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkServiceAPI implements BaseAPIService {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 15));
      return returnResponse(response);
    } on SocketException {
      throw NoInternetException('Internet is not available');
    } on TimeoutException {
      throw TimeoutException('Time out retry again');
    }
  }

  @override
  Future<dynamic> postApi(String url, Map map) async {
    try {
      final response = await http.post(Uri.parse(url), body: map).timeout(const Duration(seconds: 15));
      return returnResponse(response);
    } on SocketException {
      throw NoInternetException('Internet is not available');
    } on TimeoutException {
      throw TimeoutException('Time out retry again');
    }
  }

  returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnAuthorizedException('You dont have access');
      case 500:
        throw FetchDataException('Error communicating with server ${response.statusCode}');
      default:
        throw UnAuthorizedException('You dont have access');
    }
  }
}
