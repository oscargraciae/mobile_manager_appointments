import 'package:intl/intl.dart';

String formatDateLG(DateTime date) {
  Intl.defaultLocale = 'es_ES';
  var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date.toIso8601String()).toLocal();
  return DateFormat('d MMMM y HH:mm').format(dateValue);
}

String formatDate(DateTime date) {
  Intl.defaultLocale = 'es_ES';
  var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date.toIso8601String()).toLocal();
  return DateFormat('d MMMM y').format(dateValue);
}

String formatDateHour(DateTime date) {
  Intl.defaultLocale = 'es_ES';
  var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date.toIso8601String()).toLocal();
  return DateFormat.jm().format(dateValue);
}

String finishTime(DateTime date, int duration) {
  Intl.defaultLocale = 'es_ES';
  var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date.toIso8601String()).toLocal();
  var endTime = dateValue.add(new Duration(minutes: duration));
  return DateFormat.jm().format(endTime);
}