import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get toBrazilianDate {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }

  String get toBrazilianDateTime {
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(this);
  }

  String get toBrazilianTime {
    final formatter = DateFormat('HH:mm');
    return formatter.format(this);
  }
}
