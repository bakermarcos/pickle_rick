import 'package:pickle_rick/domain/characteres/models/character_location.dart';
import 'package:pickle_rick/domain/characteres/models/character_status_enum.dart';
import 'package:pickle_rick/domain/characteres/models/gender_enum.dart';

class Character {
  final int id;
  final String url;
  final String name;
  final String type;
  final String species;
  final String imageUrl;
  final GenderEnum gender;
  final List<String> episodes;
  final CharacterStatusEnum status;
  final CharacterLocation originName;
  final CharacterLocation locationName;

  Character({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.status,
    required this.gender,
    required this.species,
    required this.episodes,
    required this.imageUrl,
    required this.originName,
    required this.locationName,
  });
}