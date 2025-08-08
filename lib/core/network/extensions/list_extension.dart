extension ListDynamicExtension on List<dynamic> {
  List<Map<String, dynamic>> get getSafetyJsonList => whereType<Map<String, dynamic>>().toList();
}
