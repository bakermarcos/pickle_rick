import 'package:pickle_rick/core/network/api/api_handler.dart';
import 'package:pickle_rick/core/network/statics/endpoints.dart';

class CharacteresDatasource {
  final ApiHandler apiHandler;

  CharacteresDatasource(this.apiHandler);

  Future<dynamic> fetchCharacters({dynamic queryParameters}) async {
    return await apiHandler.get(
      Endpoints.character,
      queryParameters: queryParameters,
    );
  }

  Future<dynamic> fetchCharacterById({required int id, dynamic queryParameters}) async {
    return await apiHandler.get(
      '${Endpoints.character}/$id',
      queryParameters: queryParameters,
    );
  }
}
