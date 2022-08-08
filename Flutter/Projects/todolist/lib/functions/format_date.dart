import 'package:intl/intl.dart';

String formatDate(DateTime? date) {
  // date => 02-01-2022 23:23:11
  if (date != null) {
    DateTime todayDate = DateTime.now(); // 02-01-2022 12:00:01
    DateTime yesterdayDate =
        todayDate.subtract(const Duration(days: 1)); // 01-01-2022 12:00:01
    DateTime tomorrowDate =
        todayDate.add(const Duration(days: 1)); // 03-01-2022 12:00:01

    String todayDateStr = todayDate.toString().split(" ")[0]; // 02-01-2022
    String yesterdayDateStr =
        yesterdayDate.toString().split(" ")[0]; // 01-01-2022
    String tomorrowDateStr =
        tomorrowDate.toString().split(" ")[0]; // 03-01-2022

    String dateStr = date.toString().split(" ")[0]; // 02-02-2022

    if (dateStr == todayDateStr) {
      return "Today";
    } else if (dateStr == yesterdayDateStr) {
      return "Yesterday";
    } else if (dateStr == tomorrowDateStr) {
      return "Tomorrow";
    }

    String newformat = DateFormat().format(date); // 2 January 2022 23:23:11
    List<String> dateList =
        newformat.split(" ").sublist(0, 3); // [2, January, 2022]
    return dateList.join(" "); // 2 January 2022
  }
  return "";
}
