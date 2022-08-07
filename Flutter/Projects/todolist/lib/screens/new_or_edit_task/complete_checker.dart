import 'package:flutter/material.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

class CompleteChecker extends StatefulWidget {
  CompleteChecker({required this.taskValues, Key? key}) : super(key: key);
  TaskValues taskValues;
  @override
  State<CompleteChecker> createState() => _CompleteCheckerState();
}

class _CompleteCheckerState extends State<CompleteChecker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: CheckboxListTile(
        title: const Text("Complete"),
        value: widget.taskValues.complete,
        onChanged: (newValue) {
          setState(() {
            widget.taskValues.complete = newValue;
          });
        },
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }
}
