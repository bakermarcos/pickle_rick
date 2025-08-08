// import 'dart:convert';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomInterceptors extends Interceptor {
  CustomInterceptors();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dynamic responseData = response.data;
    if (responseData is String) {
      try {
        responseData = json.decode(responseData);
      } catch (e) {
        debugPrint('Response is not a valid JSON: $responseData');
      }
    }
    if (responseData is Map<String, dynamic> && responseData.containsKey('error')) {
      debugPrint('DETECTED ERROR IN RESPONSE: ${responseData['error']}');
      final error = DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: responseData['error'], // Adiciona o erro detectado
      );
      return handler.reject(error);
    }
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.uri}');
    super.onError(err, handler);
  }
}
