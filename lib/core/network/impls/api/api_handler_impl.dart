import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pickle_rick/core/network/api/api_handler.dart';
import 'package:pickle_rick/core/network/api/client/api.dart';
import 'package:pickle_rick/core/network/api/data_result/data_result.dart';

import 'data_result/remote_data_result.dart';

class ApiHandlerImpl implements ApiHandler {
  final Api api;
  ApiHandlerImpl(this.api);

  @override
  Future<DataResult> delete(
    String path, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    final response = await api.client.delete(
      path,
      queryParameters: queryParameters,
    );
    return RemoteDataResult(data: response.data);
  }

  @override
  Future<DataResult> download(
    String path,
    String pathSaved, {
    Map? body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await api.client.download(
      path,
      pathSaved,
      data: json.encode(body),
      options: Options(headers: headers),
    );
    return RemoteDataResult(data: response.data);
  }

  @override
  Future<DataResult> get(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await api.client.get(
      path,
      options: options,
      queryParameters: queryParameters,
    );
    return RemoteDataResult(data: response.data);
  }

  @override
  Future<DataResult> patch(
    String path,
    Map body,
    Map<String, dynamic>? queryParameters,
  ) async {
    final response = await api.client.patch(
      path,
      data: json.encode(body),
      queryParameters: queryParameters,
    );
    return RemoteDataResult(data: response.data);
  }

  @override
  Future<DataResult> post(
    String path,
    Map body, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    final response = await api.client.post(
      path,
      data: json.encode(body),
      queryParameters: queryParameters,
    );
    return RemoteDataResult(data: response.data);
  }

  @override
  Future<DataResult> put(
    String path,
    Map body, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    final response = await api.client.put(
      path,
      data: json.encode(body),
      queryParameters: queryParameters,
    );
    return RemoteDataResult(data: response.data);
  }

  @override
  Future<DataResult> postFormData(
    String path, {
    required dynamic formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await api.client.post(
      path,
      data: formData as FormData,
      queryParameters: queryParameters,
    );
    return RemoteDataResult(data: response.data);
  }
}
