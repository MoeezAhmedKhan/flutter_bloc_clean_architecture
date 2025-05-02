import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../exception/app_exception.dart';
import 'base_api_service.dart';

class NetworkServiceAPI implements BaseAPIService {
  @override
   Future<dynamic> getApi(String url) async {
    log("Get url: $url");
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 15));
      log("Get reponse code: ${response.statusCode} \n Get reponse: $response");
      return returnResponse(response);
    } on SocketException {
      throw NoInternetException('Internet is not available');
    } on TimeoutException {
      throw TimeoutException('Time out retry again');
    }
  }

  @override
  Future<dynamic> postApi(String url, Map map, {Map<String, String>? headers = const {}}) async {
    log("Post url: $url || Post map: $map");
    try {
      final response = await http.post(Uri.parse(url), body: map, headers: headers).timeout(const Duration(seconds: 15));
      log("Post reponse code: ${response.statusCode} || Post reponse: ${response.body}");
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
        throw UnAuthorizedException('');
      case 500:
        throw FetchDataException('Error communicating with server ${response.statusCode}');
      default:
        throw UnAuthorizedException();
    }
  }
}
