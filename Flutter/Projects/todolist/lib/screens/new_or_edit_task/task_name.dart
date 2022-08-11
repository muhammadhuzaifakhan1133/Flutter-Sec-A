import 'package:flutter/material.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';
import 'package:todolist/widgets/text_field.dart';

class TaskName extends StatelessWidget {
  TaskName({required this.taskValues, required this.nameError, Key? key})
      : super(key: key);
  TaskValues taskValues;
  String? nameError;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: textFieldWidget(
          size: size,
          widthPercent: 0.65,
          heightPercent: 0.1,
          controller: taskValues.name,
          hintText: "Enter task name",
          errorText: nameError),
    );
  }
}
