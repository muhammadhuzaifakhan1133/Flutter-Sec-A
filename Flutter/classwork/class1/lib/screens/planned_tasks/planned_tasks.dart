import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlannedTasks extends StatefulWidget {
  const PlannedTasks({Key? key}) : super(key: key);

  @override
  State<PlannedTasks> createState() => _PlannedTasksState();
}

class _PlannedTasksState extends State<PlannedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Planned tasks will be show here"),
      ),
    );
  }
}
