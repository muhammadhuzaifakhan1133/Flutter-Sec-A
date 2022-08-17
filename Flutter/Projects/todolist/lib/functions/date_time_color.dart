import 'package:flutter/material.dart';

Color? getDateColor(DateTime? date, DateTime? time) {
  if (date != null) {
    DateTime now = DateTime.now();
    DateTime dateTime;
    if (time == null) {
      dateTime = date;
      if (now.toString().split(" ")[0] == dateTime.toString().split(" ")[0]) {
        return Colors.black;
      }
    } else {
      dateTime = DateTime.parse(
          "${date.toString().split(" ")[0]} ${time.toString().split(" ")[1]}");
    }
    return now.compareTo(dateTime) == 1 ? Colors.red : Colors.black;
  }
}
