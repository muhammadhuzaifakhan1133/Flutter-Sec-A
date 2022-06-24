import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UnplannedTasks extends StatefulWidget {
  const UnplannedTasks({Key? key}) : super(key: key);

  @override
  State<UnplannedTasks> createState() => _UnplannedTasksState();
}

class _UnplannedTasksState extends State<UnplannedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Unplanned tasks will be show here")),
    );
  }
}
