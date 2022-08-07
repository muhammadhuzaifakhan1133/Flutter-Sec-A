import 'package:flutter/cupertino.dart';

class TaskValues {
  String? name;
  bool? complete;
  bool? important;
  DateTime? date;
  DateTime? time;

  TaskValues(
      {required this.name,
      required this.complete,
      required this.important,
      required this.date,
      required this.time});
}
