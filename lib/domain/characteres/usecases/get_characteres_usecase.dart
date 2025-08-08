import 'package:pickle_rick/core/network/api/models/paginated_model.dart';
import 'package:pickle_rick/core/network/api/result/result.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';
import 'package:pickle_rick/domain/characteres/repository/characteres_repository.dart';

class GetCharactersUseCase {
  final CharacteresRepository _repository;
  GetCharactersUseCase(this._repository);
  Future<Result<PaginatedModel<Character>, Exception>> call({int page = 1}) async {
    return await _repository.fetchCharacters(page: page);
  }
}
