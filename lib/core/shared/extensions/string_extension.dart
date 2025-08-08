extension StringExtension on String {
  String get characterId {
    return substring(lastIndexOf('/') + 1);
  }

  String get pageId {
    return substring(lastIndexOf('page=') + 5);
  }
}
