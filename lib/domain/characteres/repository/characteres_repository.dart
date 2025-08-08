import 'package:pickle_rick/core/network/api/models/paginated_model.dart';
import 'package:pickle_rick/core/network/api/result/result.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';

abstract class CharacteresRepository {
  Future<Result<PaginatedModel<Character>, Exception>> fetchCharacters({required int page});
  Future<Result<Character, Exception>> fetchCharacterById({required int id});

}