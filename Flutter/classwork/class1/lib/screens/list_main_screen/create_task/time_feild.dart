import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeField extends StatelessWidget {
  TimeField({
    Key? key,
    required this.isTimeEnable,
    required this.timeController,
  }) : super(key: key);

  bool isTimeEnable;
  var timeController;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      enabled: isTimeEnable,
      decoration: InputDecoration(
          hintText: "Select Due Time",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
      controller: timeController,
      format: DateFormat("HH:mm"),
      onShowPicker: (context, currentValue) async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        );
        return DateTimeField.convert(time);
      },
    );
  }
}
