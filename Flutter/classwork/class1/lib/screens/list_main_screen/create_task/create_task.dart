import 'package:class1/screens/list_main_screen/create_task/action_buttons.dart';
import 'package:class1/screens/list_main_screen/create_task/date_field.dart';
import 'package:class1/screens/list_main_screen/create_task/horizontal_line.dart';
import 'package:class1/screens/list_main_screen/create_task/time_feild.dart';
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
                DateField(
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
                  dateController: dateController,
                ),
                SizedBox(height: 15),
                TimeField(
                    isTimeEnable: isTimeEnable, timeController: timeController),
              ],
            ),
            actions: actionButtons(context, timeController, dateController,
                isButtonEnable, onPressedfinalButton, finalButtonText),
          );
        });
      });
}
