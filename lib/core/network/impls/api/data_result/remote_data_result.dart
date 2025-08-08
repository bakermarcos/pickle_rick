import 'dart:convert';
import 'dart:typed_data';
import 'package:pickle_rick/core/network/api/data_result/data_result.dart';

class RemoteDataResult implements DataResult {
  final dynamic data;

  RemoteDataResult({required this.data});

  Map<String, dynamic> get jsonData {
    if (data is Map<String, dynamic>) {
      return data;
    } else {
      final jsonParsed = json.decode(data);
      if (jsonParsed is Map<String, dynamic>) {
        return jsonParsed;
      }
      throw Exception("Data is not a Json object");
    }
  }

  Uint8List get bytes {
    if (data is Uint8List) {
      return data;
    } else {
      throw Exception("Data is not a Uint8List");
    }
  }
}
