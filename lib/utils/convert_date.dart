import 'package:intl/intl.dart';

class ConvertDate {
  static String convertDate(dynamic value) {
    var date = DateTime.parse(value.toString());
    var format = DateFormat('d MMM yyyy', 'id').format(date);
    return format;
  }

  static String convertYear(dynamic value) {
    var date = DateTime.parse(value.toString());
    var format = DateFormat('yyyy', 'id').format(date);
    return format;
  }
}
