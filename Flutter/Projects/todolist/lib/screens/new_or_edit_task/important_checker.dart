import 'package:flutter/material.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

class ImportantChecker extends StatefulWidget {
  ImportantChecker({required this.taskValues, Key? key}) : super(key: key);
  TaskValues taskValues;

  @override
  State<ImportantChecker> createState() => _ImportantCheckerState();
}

class _ImportantCheckerState extends State<ImportantChecker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: CheckboxListTile(
        title: const Text("Important"),
        value: widget.taskValues.important,
        onChanged: (value) {
          setState(() {
            widget.taskValues.important = value;
          });
        },
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }
}
