import 'package:flutter/material.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

class TaskName extends StatelessWidget {
  TaskName({required this.taskValues, required this.nameError, Key? key})
      : super(key: key);
  TaskValues taskValues;
  String? nameError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        height: 50,
        width: 250,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextFormField(
            controller: taskValues.name,
            decoration: InputDecoration(
              hintText: "Enter task name",
              errorText: nameError,
            ),
          ),
        ),
      ),
    );
  }
}
