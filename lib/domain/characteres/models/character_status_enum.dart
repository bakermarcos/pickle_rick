import 'package:flutter/material.dart';

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
        return 'Unknown';
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

  static Color getStatusColor(CharacterStatusEnum status) {
    switch (status) {
      case CharacterStatusEnum.alive:
        return Colors.green;
      case CharacterStatusEnum.dead:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}