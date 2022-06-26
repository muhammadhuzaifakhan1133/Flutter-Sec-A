import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskMainScreen extends StatefulWidget {
  TaskMainScreen({required this.task_name, Key? key}) : super(key: key);
  String task_name;
  @override
  State<TaskMainScreen> createState() => _TaskMainScreenState();
}

class _TaskMainScreenState extends State<TaskMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("This is task main screen. Eg. ${widget.task_name}")),
    );
  }
}
