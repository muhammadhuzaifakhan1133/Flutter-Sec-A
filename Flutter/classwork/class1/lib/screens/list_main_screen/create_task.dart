import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

createOrUpdateTask(
    {context,
    titleController,
    dateTimeController,
    hintText,
    dialogTitile,
    finalButtonText,
    onPressedfinalButton}) {
  bool isButtonEnable = false;
  String newName = "";
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text(dialogTitile),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  onChanged: (text) {
                    setState(() {
                      if (text.isNotEmpty) {
                        isButtonEnable = true;
                      } else {
                        isButtonEnable = false;
                      }
                    });
                    titleController.text = text;
                  },
                  decoration: InputDecoration(hintText: hintText),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("(Opitonal)"),
                SizedBox(
                  height: 5,
                ),
                DateTimeField(
                  controller: dateTimeController,
                  decoration: InputDecoration(
                      hintText: "Select Due Date",
                      suffixIcon: Icon(Icons.date_range_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(15))),
                  format: DateFormat("yyyy-MM-dd HH:mm"),
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      dateTimeController.text =
                          DateTimeField.combine(date, time).toString();
                    } else {
                      print("Current Value: $currentValue");
                    }
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  isButtonEnable = false;
                },
                child: Text("CANCEL"),
              ),
              ElevatedButton(
                onPressed: isButtonEnable ? onPressedfinalButton : null,
                child: Text(finalButtonText),
              )
            ],
          );
        });
      });
}
