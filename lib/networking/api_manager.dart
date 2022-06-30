import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:temp_mail/screens/login_screen/login_screen.dart';
import 'dart:io';
import 'dart:async';
import '../utils/appConstant.dart';
import 'custom_exception.dart';

class APIManager {
  static Future<dynamic> postAPICall(
      {required String url,
      required Map<String, String> body,
      Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      if (header != null) {
        var req = http.Request("POST", Uri.parse(url))..headers.addAll(header);
        req.body = jsonEncode(body);
        responseJson = req;
      } else {
        var req = http.Request("POST", Uri.parse(url));
        req.body = jsonEncode(body);
        responseJson = req;
      }

      final streamedResponse = await responseJson.send();
      var response = await http.Response.fromStream(streamedResponse)
          .timeout(const Duration(seconds: 30));
      debugPrint("URL:: $url");
      debugPrint("BODY:: $body");
      debugPrint("RESPONSE:: ${response.body}");
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }

  static Future<dynamic> deleteAPICall(
      {required String url, Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      var request = http.Request('DELETE', Uri.parse(url));
      request.headers.addAll(header!);
      http.StreamedResponse response = await request.send();

      var responseString = await http.Response.fromStream(response);
      responseJson = _response(responseString);
      debugPrint("URL:: $url");
      debugPrint("RESPONSE:: ${responseString.body}");
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }

  static Future<dynamic> getAPICall(
      {required String url, Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 30));

      if (response.body.toString().contains('Unauthenticated')) {
        Get.offAll(() => const LoginScreen());
      }

      debugPrint("URL:: $url");
      debugPrint("Method:: GET");
      debugPrint("RESPONSE:: ${response.body}");
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }
}

dynamic _response(http.Response response) {
  print("object>>>>>>>>> ${response.statusCode}");
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body.toString();
      return responseJson;
    case 201:
      var responseJson = response.body.toString();
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 422:
      throw UnprocessableEntity(response.body.toString());
    case 404:
      throw UnauthorisedException(response.body.toString());
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
      throw InternalServerError(response.body.toString());
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
  }
}

void apiErrorMessage(String msg) {
  if (msg == "Time Out: null") {
    errorSnackbar("Network time out");
  } else if (msg == "Error_no_internet") {
    errorSnackbar("Check your internet connection");
  } else {
    errorSnackbar(msg);
  }
}
