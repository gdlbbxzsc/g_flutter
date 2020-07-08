import 'package:intl/intl.dart';

class DateUtils {
  static String aa() {
    DateTime dateTime =
        DateFormat('yyyy-MM-dd HH:mm').parse("2333-12-12 12:12");
    String formattedDate = DateFormat('yyyy年MM月dd日').format(dateTime);
    return formattedDate;
  }
}
