import 'package:flutter/material.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

class TaskName extends StatelessWidget {
  TaskName({required this.taskValues, Key? key}) : super(key: key);
  TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextFormField(
            initialValue:
                (taskValues.name!.isNotEmpty) ? taskValues.name : null,
            decoration: const InputDecoration(hintText: "Enter task name"),
            onChanged: (value) {
              taskValues.name = value;
            },
          ),
        ),
      ),
    );
  }
}
