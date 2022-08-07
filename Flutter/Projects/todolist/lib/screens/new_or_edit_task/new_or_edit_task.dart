import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/new_or_edit_task/complete_checker.dart';
import 'package:todolist/screens/new_or_edit_task/date_time_picker.dart';
import 'package:todolist/screens/new_or_edit_task/important_checker.dart';
import 'package:todolist/screens/new_or_edit_task/task_name.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';
import 'package:todolist/widgets/button.dart';

class NewOrEditTask extends StatelessWidget {
  NewOrEditTask(
      {required this.listID,
      this.name = "",
      this.complete = false,
      this.important = false,
      this.date,
      this.time,
      Key? key})
      : super(key: key);
  String listID;
  String name;
  bool complete;
  bool important;
  DateTime? date;
  DateTime? time;
  @override
  Widget build(BuildContext context) {
    TaskValues taskValues = TaskValues(
        name: name,
        complete: complete,
        important: important,
        date: date,
        time: time);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: backButton(context, Colors.black),
        title: const Text("New Task", style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          children: [
            TaskName(taskValues: taskValues),
            ImportantChecker(taskValues: taskValues),
            CompleteChecker(taskValues: taskValues),
            CustomDateTimePicker(taskValues: taskValues),
            buttonWidget(
                size: size,
                text: "CREATE",
                topPadding: 30,
                widthPercent: 0.5,
                heightPercent: 0.07,
                buttonColor: Colors.blue,
                radius: 8,
                onpressed: () async {
                  print(taskValues.name);
                  print(taskValues.complete);
                  print(taskValues.important);
                  print(taskValues.date);
                  print(taskValues.time);
                  // await addTask(listID: widget.listID, taskValues: taskValues);
                })
          ],
        ),
      ),
    );
  }
}
