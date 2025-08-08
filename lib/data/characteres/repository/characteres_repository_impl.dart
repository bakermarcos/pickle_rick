import 'package:pickle_rick/core/network/api/models/paginated_model.dart';
import 'package:pickle_rick/core/network/api/result/result.dart';
import 'package:pickle_rick/core/network/impls/api/base/base_repository.dart';
import 'package:pickle_rick/core/network/impls/api/data_result/remote_data_result.dart';
import 'package:pickle_rick/data/characteres/datasource/characteres_datasource.dart';
import 'package:pickle_rick/data/characteres/dtos/character_dto.dart';
import 'package:pickle_rick/data/characteres/dtos/paginated_characteres_dto.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';
import 'package:pickle_rick/domain/characteres/repository/characteres_repository.dart';

class CharacteresRepositoryImpl extends BaseRepository
    implements CharacteresRepository {
  final CharacteresDatasource _datasource;
  CharacteresRepositoryImpl(this._datasource);

  @override
  Future<Result<Character, Exception>> fetchCharacterById({
    required int id,
  }) async {
    try {
      final response = await _datasource.fetchCharacterById(id: id);
      response as RemoteDataResult;
      return Result.success(CharacterDto.fromData(response.data));
    } catch (e) {
      return handleFailure(
        error: e,
        trace: StackTrace.current,
        repositoryName: 'CharacteresRepository',
      );
    }
  }

  @override
  Future<Result<PaginatedModel<Character>, Exception>> fetchCharacters({
    required int page,
  }) async {
    try {
      final response = await _datasource.fetchCharacters(
        queryParameters: {'page': page},
      );
      response as RemoteDataResult;
      return Result.success(PaginatedCharacteresDto.fromData(response.data));
    } catch (e) {
      return handleFailure(
        error: e,
        trace: StackTrace.current,
        repositoryName: 'CharacteresRepository',
      );
    }
  }
}
