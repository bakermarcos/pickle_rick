enum CharacterStatusEnum {
  alive,
  dead,
  unknown;

  String get value {
    switch (this) {
      case CharacterStatusEnum.alive:
        return 'Alive';
      case CharacterStatusEnum.dead:
        return 'Dead';
      case CharacterStatusEnum.unknown:
        return 'unknown';
    }
  }

  static CharacterStatusEnum fromString(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return CharacterStatusEnum.alive;
      case 'dead':
        return CharacterStatusEnum.dead;
      default:
        return CharacterStatusEnum.unknown;
    }
  }
}