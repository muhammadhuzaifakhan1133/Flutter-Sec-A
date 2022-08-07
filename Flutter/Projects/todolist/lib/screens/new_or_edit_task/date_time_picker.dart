import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

class CustomDateTimePicker extends StatefulWidget {
  CustomDateTimePicker({required this.taskValues, Key? key}) : super(key: key);
  TaskValues taskValues;

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Enter date",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Container(
                width: 250,
                height: 50,
                padding: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(border: Border.all()),
                child: DateTimeField(
                  onChanged: (date) {
                    setState(() {
                      widget.taskValues.date = date;
                    });
                  },
                  format: DateFormat("yyyy-MM-dd"),
                  onShowPicker: (context, currentValue) async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    widget.taskValues.date = date;
                    return widget.taskValues.date;
                  },
                ),
              ),
            ],
          ),
        ),
        if (widget.taskValues.date != null)
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Enter time",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                    width: 250,
                    height: 50,
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(border: Border.all()),
                    child: DateTimeField(
                      onChanged: (time) {
                        setState(() {
                          widget.taskValues.time = time;
                        });
                      },
                      format: DateFormat("HH:mm"),
                      onShowPicker: (context, currentValue) async {
                        TimeOfDay? timePicker = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        widget.taskValues.time =
                            DateTimeField.convert(timePicker);
                        return widget.taskValues.time;
                      },
                    )),
              ],
            ),
          )
      ],
    );
  }
}
