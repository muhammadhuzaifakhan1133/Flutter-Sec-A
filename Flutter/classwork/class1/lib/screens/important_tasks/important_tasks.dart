import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImportantTasks extends StatefulWidget {
  const ImportantTasks({Key? key}) : super(key: key);

  @override
  State<ImportantTasks> createState() => _ImportantTasksState();
}

class _ImportantTasksState extends State<ImportantTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Important Tasks will be show here")),
    );
  }
}
