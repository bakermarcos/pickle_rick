import 'package:dio/dio.dart';

import 'data_result/data_result.dart';

abstract class ApiHandler {
  Future<DataResult> post(
    String path,
    Map body, [
    Map<String, dynamic>? queryParameters,
  ]);

  Future<DataResult> put(
    String path,
    Map body, [
    Map<String, dynamic>? queryParameters,
  ]);

  Future<DataResult> patch(
    String path,
    Map body,
    Map<String, dynamic>? queryParameters,
  );

  Future<DataResult> get(
    String path, {
    Map? body,
    Options? options,
    Map<String, dynamic>? queryParameters,
  });

  Future<DataResult> delete(
    String path, [
    Map<String, dynamic>? queryParameters,
  ]);

  Future<DataResult> download(
    String path,
    String pathSaved, {
    Map? body,
    Map<String, dynamic>? headers,
  });

  Future<DataResult> postFormData(
    String path, {
    required dynamic formData,
    Map<String, dynamic>? queryParameters,
  });
}
