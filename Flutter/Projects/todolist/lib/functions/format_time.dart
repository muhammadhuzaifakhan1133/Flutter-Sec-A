import 'package:intl/intl.dart';

String formatTime(DateTime? time) {
  if (time != null) {
    return DateFormat("h:mma").format(time).toString();
  }
  return "";
}
