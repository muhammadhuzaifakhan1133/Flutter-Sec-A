import 'package:class1/screens/list_main_screen/create_task/action_buttons.dart';
import 'package:class1/screens/list_main_screen/create_task/horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

createOrUpdateTask(
    {context,
    titleController,
    dateController,
    timeController,
    hintText,
    dialogTitile,
    finalButtonText,
    onPressedfinalButton}) {
  bool isButtonEnable = false;
  bool isTimeEnable = false;
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
                horizontalOptionalLine(),
                SizedBox(
                  height: 15,
                ),
                DateTimeField(
                  controller: dateController,
                  decoration: InputDecoration(
                      hintText: "Select Due Date",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                  onChanged: (date) {
                    setState(() {
                      if (dateController.text.isNotEmpty) {
                        isTimeEnable = true;
                        timeController.text = DateFormat("HH:mm")
                            .format(DateTime.now())
                            .toString();
                      } else {
                        isTimeEnable = false;
                      }
                    });
                  },
                  format: DateFormat("dd-MM-yyyy"),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
                SizedBox(height: 15),
                DateTimeField(
                  enabled: isTimeEnable,
                  decoration: InputDecoration(
                      hintText: "Select Due Time",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                  controller: timeController,
                  format: DateFormat("HH:mm"),
                  onShowPicker: (context, currentValue) async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.convert(time);
                  },
                ),
              ],
            ),
            actions: actionButtons(context, timeController, dateController,
                isButtonEnable, onPressedfinalButton, finalButtonText),
          );
        });
      });
}
