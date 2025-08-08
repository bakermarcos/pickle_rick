enum GenderEnum {
  male,
  female,
  genderless,
  unknown;

  String get value {
    switch (this) {
      case GenderEnum.male:
        return 'Male';
      case GenderEnum.female:
        return 'Female';
      case GenderEnum.genderless:
        return 'Genderless';
      case GenderEnum.unknown:
        return 'Unknown';
    }
  }

  static GenderEnum fromString(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return GenderEnum.male;
      case 'female':
        return GenderEnum.female;
      case 'genderless':
        return GenderEnum.genderless;
      default:
        return GenderEnum.unknown;
    }
  }
}