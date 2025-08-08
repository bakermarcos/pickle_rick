extension MapExtension on Map {
  T getValue<T>({required String key}) {
    var value = this[key];

    if (value == null) null;

    return value as T;
  }

  T getValueOrDefault<K, T>({
    required K key,
    required T defaultValue,
  }) {
    var value = this[key];
    return value ?? defaultValue;
  }

  bool getBoolValueOrDefault<K, T>({
    required K key,
    required T defaultValue,
  }) {
    if (this[key] is String) {
      return this[key].toString().toLowerCase() == 'true';
    }
    final value = getValueOrDefault(key: key, defaultValue: defaultValue);
    return value.toString().toLowerCase() == 'true';
  }

  T getDynamicValue<K, T>({
    required K key,
  }) {
    final value = this[key];
    switch (value.runtimeType) {
      case const (int):
        return value as T;
      case const (double):
        return value as T;
      case const (String):
        return value as T;
      case const (bool):
        return value as T;
      default:
        return value as T;
    }
  }

  dynamic getDeepValue({
    required String keys,
  }) {
    return _getDeepValue(keys: keys);
  }

  dynamic _getDeepValue({
    required String keys,
  }) {
    if (keys.contains("|")) {
      final splitKeys = keys.split("|");
      final value = this[splitKeys[0]];
      if (value is Map) {
        final range = splitKeys..removeAt(0);
        return value._getDeepValue(keys: range.join("|"));
      }
    }
    return this[keys];
  }

  T getDeepValueOrDefault<T>({
    required String keys,
    required T defaultValue,
  }) {
    return _getDeepValueOrDefault(keys: keys, defaultValue: defaultValue);
  }

  dynamic _getDeepValueOrDefault<T>({
    required String keys,
    required T defaultValue,
  }) {
    if (keys.contains("|")) {
      final splitKeys = keys.split("|");
      final value = this[splitKeys[0]];
      if (value is Map) {
        final range = splitKeys..removeAt(0);
        return value._getDeepValueOrDefault(keys: range.join("|"), defaultValue: defaultValue);
      }
    }
    return this[keys] ?? defaultValue;
  }

  DateTime? getCompleteDateTime<K, T>({
    required K key,
    required T defaultValue,
  }) {
    final value = getValueOrDefault(key: key, defaultValue: defaultValue);
    return DateTime.tryParse(value as String);
  }

  DateTime getDateTime({
    required String key,
  }) {
    final value = getValue(key: key);
    return DateTime.parse(value as String);
  }

  int getPerPageValue<K, T>({
    required K key,
    required T defaultValue,
  }) {
    final value = getValueOrDefault<K, dynamic>(key: key, defaultValue: defaultValue);

    return int.tryParse(value.toString()) ?? 0;
  }

  String getNumValueString({
    required String key,
  }) {
    final value = getValue(key: key);
    return (num.tryParse(value.toString()) ?? 0).toString();
  }

  int getIntValueOrDefault({
    required String key,
  }) {
    final value = getValue(key: key);
    return int.tryParse(value.toString()) ?? 0;
  }
}

extension MapExtensionNullable on Map? {
  dynamic getValueOrDefault({
    required String key,
    required dynamic defaultValue,
  }) {
    if (this == null) return defaultValue;
    if (this![key] == null) return defaultValue;
    return this![key];
  }
}
