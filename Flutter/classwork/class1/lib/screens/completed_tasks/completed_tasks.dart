import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Completed tasks will be show here")),
    );
  }
}
