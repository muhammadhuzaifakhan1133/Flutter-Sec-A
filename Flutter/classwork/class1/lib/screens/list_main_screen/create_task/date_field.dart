import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  DateField({
    Key? key,
    required this.onChanged,
    required this.dateController,
  }) : super(key: key);

  var onChanged;
  var dateController;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      controller: dateController,
      decoration: InputDecoration(
          hintText: "Select Due Date",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
      onChanged: onChanged,
      format: DateFormat("dd-MM-yyyy"),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }
}
