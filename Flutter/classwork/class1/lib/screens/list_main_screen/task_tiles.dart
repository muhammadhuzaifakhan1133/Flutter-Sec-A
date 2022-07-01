import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/task_main_screen/task_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskTiles extends StatefulWidget {
  TaskTiles(
      {required this.email,
      required this.list_name,
      required this.tasksTitle,
      required this.isTasksComplete,
      required this.isTasksImportant,
      required this.tasksTime,
      required this.tasksDate,
      Key? key})
      : super(key: key);
  String email;
  String list_name;
  List<String> tasksTitle;
  List<bool> isTasksComplete;
  List<bool> isTasksImportant;
  List<String> tasksTime;
  List<String> tasksDate;

  @override
  State<TaskTiles> createState() => _TaskTilesState();
}

class _TaskTilesState extends State<TaskTiles> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.tasksTitle.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(widget.tasksTitle[index],
                style: TextStyle(
                    decoration: widget.isTasksComplete[index]
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
            leading: IconButton(
                icon: widget.isTasksComplete[index]
                    ? Icon(Icons.check_circle, color: Colors.blue, size: 30)
                    : Icon(Icons.circle_outlined, size: 30),
                onPressed: () async {
                  setState(() {
                    widget.isTasksComplete[index] =
                        !widget.isTasksComplete[index];
                  });
                  await saveTaskCompletionLocally(
                      widget.email, widget.list_name, index);
                }),
            subtitle:
                Text(widget.tasksDate[index] + " " + widget.tasksTime[index]),
            trailing: IconButton(
                icon: widget.isTasksImportant[index]
                    ? Icon(Icons.star, color: Colors.blue, size: 30)
                    : Icon(Icons.star_border, size: 30),
                onPressed: () async {
                  setState(() {
                    widget.isTasksImportant[index] =
                        !widget.isTasksImportant[index];
                  });
                  await saveTaskImportancyLocally(
                      widget.email, widget.list_name, index);
                }),
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskMainScreen(
                              task_name: widget.tasksTitle[index])))
                  .then((_) async {
                List<List<dynamic>> values =
                    await getTaskList(widget.email, widget.list_name);
                widget.tasksTitle = values[0] as List<String>;
                widget.isTasksComplete =
                    values[1].map((e) => e == "true").toList();
                widget.isTasksImportant =
                    values[2].map((e) => e == "true").toList();
                widget.tasksDate = values[3] as List<String>;
                widget.tasksTime = values[4] as List<String>;
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 5,
          );
        },
      ),
    );
  }
}
