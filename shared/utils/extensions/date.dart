import 'package:intl/intl.dart';

extension ExtDate on DateTime {
  String get toDDMMMYYYY => DateFormat('d MMM yyyy').format(this);
  String get toYYMMDD => DateFormat('YYMMDD').format(this);
  String get toYYYYMMDD => DateFormat('yyyy-MM-dd').format(this);
  String get toEEEEdMMMMY => DateFormat('EEEE d, MMMM, y').format(this);
  String get timeTo12Hour => DateFormat.jm().format(this);
}
