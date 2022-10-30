import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/firebase/list_and_task.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/new_or_edit_task/complete_checker.dart';
import 'package:todolist/screens/new_or_edit_task/date_time_picker.dart';
import 'package:todolist/screens/new_or_edit_task/delete_task.dart';
import 'package:todolist/screens/new_or_edit_task/important_checker.dart';
import 'package:todolist/screens/new_or_edit_task/task_name.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/loading_widget.dart';

class NewOrEditTask extends StatefulWidget {
  NewOrEditTask(
      {this.listID,
      this.name,
      this.complete = false,
      this.important = false,
      this.date,
      this.time,
      required this.appBarText,
      required this.buttonText,
      this.taskID,
      Key? key})
      : super(key: key);
  String? listID;
  String? taskID;
  TextEditingController? name;
  bool complete;
  bool important;
  DateTime? date;
  DateTime? time;
  String appBarText;
  String buttonText;

  @override
  State<NewOrEditTask> createState() => _NewOrEditTaskState();
}

class _NewOrEditTaskState extends State<NewOrEditTask> {
  String? nameError;
  late TaskValues taskValues;

  @override
  void initState() {
    super.initState();
    taskValues = TaskValues(
        name: widget.name,
        complete: widget.complete,
        important: widget.important,
        date: widget.date,
        time: widget.time);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: backButton(context, Colors.black),
        title: Text(widget.appBarText,
            style: const TextStyle(color: Colors.black)),
        actions: widget.taskID != null
            ? [deleteTaskIcon(context, widget.taskID!)]
            : null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskName(taskValues: taskValues, nameError: nameError),
            ImportantChecker(taskValues: taskValues),
            CompleteChecker(taskValues: taskValues),
            CustomDateTimePicker(taskValues: taskValues),
            buttonWidget(
                size: size,
                text: widget.buttonText,
                topPadding: 30,
                widthPercent: 0.5,
                heightPercent: 0.07,
                buttonColor: Colors.blue,
                radius: 8,
                onpressed: () async {
                  if (taskValues.name!.text.isEmpty) {
                    setState(() {
                      nameError = "This field is required";
                    });
                    return;
                  }
                  circleProgressDialog(context);
                  if (!(await InternetConnectionChecker().hasConnection)) {
                    closeDialog(context);
                    Fluttertoast.showToast(msg: "No Internet Connection");
                    return;
                  }
                  await addOrUpdateTask(
                      listID: widget.listID!,
                      taskValues: taskValues,
                      taskID: widget.taskID,
                      update: widget.buttonText != "CREATE");

                  closeDialog(context);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
