import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pickle_rick/core/network/api/client/api.dart';
import 'package:pickle_rick/core/network/extensions/map_extension.dart';
import 'package:pickle_rick/core/network/impls/api/interceptors/custom_interceptors.dart';

class ApiClient implements Api {
  @override
  late final Dio client;
  final CustomInterceptors _customInterceptors;
  ApiClient(this._customInterceptors) {
    client = Dio()
      ..interceptors.add(_customInterceptors)
      ..options.responseType = ResponseType.json
      ..options.baseUrl = dotenv.env.getValue(key: "baseURL") as String
      ..options.connectTimeout = const Duration(milliseconds: 10000);
  }
}
