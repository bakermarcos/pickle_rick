import 'package:pickle_rick/core/network/extensions/map_extension.dart';
import 'package:pickle_rick/data/characteres/dtos/character_location_dto.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';
import 'package:pickle_rick/domain/characteres/models/character_status_enum.dart';
import 'package:pickle_rick/domain/characteres/models/gender_enum.dart';

extension CharacterDto on Character {
  static Character fromData(Map<String, dynamic> data) {
    return Character(
      id: data.getIntValueOrDefault(key: 'id'),
      name: data.getValueOrDefault(key: 'name', defaultValue: ''),
      status: CharacterStatusEnum.fromString(
        data.getValueOrDefault(key: 'status', defaultValue: ''),
      ),
      species: data.getValueOrDefault(key: 'species', defaultValue: ''),
      type: data.getValueOrDefault(key: 'type', defaultValue: ''),
      url: data.getValueOrDefault(key: 'url', defaultValue: ''),
      imageUrl: data.getValueOrDefault(key: 'image', defaultValue: ''),
      gender: GenderEnum.fromString(
        data.getValueOrDefault(key: 'gender', defaultValue: ''),
      ),
      episodes: data.getValueOrDefault(
        key: 'episode',
        defaultValue: <String>[],
      ),
      originName: CharacterLocationDto.fromData(
        data.getValueOrDefault(key: 'origin', defaultValue: {}),
      ),
      locationName: CharacterLocationDto.fromData(
        data.getValueOrDefault(key: 'location', defaultValue: {}),
      ),
    );
  }
}
