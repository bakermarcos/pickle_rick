import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pickle_rick/core/network/impls/api/dto/failure_dto.dart';
import 'package:pickle_rick/core/network/impls/api/exceptions/map_value_exception.dart';
import 'package:pickle_rick/core/network/impls/api/exceptions/response_exception.dart';

extension ExceptionExtension on Exception {
  void debugPrint() {
    var msg = 'Unexpected exception';

    if (this is MapValueException) {
      msg = "Fail to parse json";
    }
    if (this is ResponseException) {
      msg = "Received param isn't a Map<String, dynamic>";
    }

    if (this is DioException) {
      msg = toString();
    }

    if (kDebugMode) {
      print('A exception occured: $msg');
    }
  }

  FailureDTO get onResultFailure {
    final response = this;

    if (response is! DioException) {
      debugPrint();
      return genericError("Dados incompletos");
    }

    if (response.response == null) {
      if (response.message?.contains("Failed host lookup") == true) {
        return FailureDTO.fromData({"code": "500", "message": "Não foi possível conectar ao servidor"});
      }

      return FailureDTO.fromData({"code": "500", "message": response.message ?? "Erro desconhecido"});
    }

    if (response.response?.data is! Map) {
      final decodedData = _tryDecodeResponseWithRetry(response.response?.data);
      if (decodedData != null) {
        return FailureDTO.fromData(decodedData);
      } else {
        return genericError("Erro ao processar a resposta do servidor");
      }
    }

    return FailureDTO.fromData(response.response?.data);
  }

  Map<String, dynamic>? _tryDecodeResponseWithRetry(dynamic data) {
    try {
      if (data is String) {
        return json.decode(data) as Map<String, dynamic>?;
      } else if (data != null) {
        final stringData = data.toString();
        return json.decode(stringData) as Map<String, dynamic>?;
      }
    } catch (e) {
      debugPrint();
      try {
        final fallbackString = data?.toString() ?? '{}';
        return json.decode(fallbackString) as Map<String, dynamic>?;
      } catch (retryError) {
        debugPrint();
      }
    }
    return null;
  }

  static genericError(String msg) {
    return FailureDTO.fromData({"code": "500", "message": msg});
  }
}

const genericError = {"code": "500", "message": "Dados incompletos"};
