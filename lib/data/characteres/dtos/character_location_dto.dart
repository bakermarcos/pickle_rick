import 'package:pickle_rick/core/network/extensions/map_extension.dart';
import 'package:pickle_rick/domain/characteres/models/character_location.dart';

extension CharacterLocationDto on CharacterLocation {
  static CharacterLocation fromData(Map<String, dynamic> data) {
    return CharacterLocation(
      name: data.getValueOrDefault(key: 'name', defaultValue: ''),
      url: data.getValueOrDefault(key: 'url', defaultValue: ''),
    );
  }
}
