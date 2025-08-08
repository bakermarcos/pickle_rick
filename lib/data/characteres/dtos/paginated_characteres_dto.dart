import 'package:pickle_rick/core/network/api/models/paginated_model.dart';
import 'package:pickle_rick/core/network/extensions/list_extension.dart';
import 'package:pickle_rick/core/network/extensions/map_extension.dart';
import 'package:pickle_rick/core/shared/extensions/string_extension.dart';
import 'package:pickle_rick/data/characteres/dtos/character_dto.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';

extension PaginatedCharacteresDto on PaginatedModel<Character> {
  static PaginatedModel<Character> fromData(Map<String, dynamic> data) {
    final resultsData = data.getValueOrDefault(
      key: 'results',
      defaultValue: [],
    );

    final info = data.getValueOrDefault(key: 'info', defaultValue: {});
    final nextPage = info.getValueOrDefault(key: 'next', defaultValue: '');

    return PaginatedModel<Character>(
      hasNextPage: nextPage.isNotEmpty,
      totalItems: info.getIntValueOrDefault(key: 'count'),
      totalPages: info.getIntValueOrDefault(key: 'pages'),
      results: resultsData.getSafetyJsonList
          .map((item) => CharacterDto.fromData(item))
          .toList(),
      currentPage: nextPage.isNotEmpty
          ? int.parse(nextPage.characterId) + 1
          : 1,
    );
  }
}