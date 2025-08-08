import 'package:intl/intl.dart';

extension StringExtension on String {
  String get toPrecisionString {
    num value = num.parse(this);
    return value.toStringAsFixed(2);
  }

  String get toBrazillianCurrency {
    try {
      if (contains('R\$')) {
        return this;
      }
      num value = num.parse(this);

      final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

      return formatter.format(value);
    } catch (e) {
      return this;
    }
  }

  String? get prefixFromPhone {
    final digits = replaceAll(RegExp(r'\D'), '');
    if (digits.length >= 12 && digits.startsWith('55')) {
      return digits.substring(2, 4);
    }
    if (digits.length >= 10) {
      return digits.substring(0, 2);
    }
    return null;
  }

  String get characterId {
    return substring(lastIndexOf('/') + 1);
  }

  String get pageId {
    return substring(lastIndexOf('page=') + 5);
  }
}
