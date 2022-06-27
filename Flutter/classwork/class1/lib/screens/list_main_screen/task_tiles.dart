import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/task_main_screen/task_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskTiles extends StatefulWidget {
  TaskTiles(
      {required this.list_name,
      required this.tasksTitle,
      required this.isTasksComplete,
      required this.isTasksImportant,
      required this.tasksTime,
      required this.tasksDate,
      Key? key})
      : super(key: key);
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

  getTaskList() async {
    final SharedPreferences prefs = await _prefs;
    String email = (prefs.getString(activeEmailKey))!;
    List<String>? tasks = prefs.getStringList(email + widget.list_name);
    List<String>? Complete =
        prefs.getStringList(email + widget.list_name + taskCompletionKey);
    List<String>? important =
        prefs.getStringList(email + widget.list_name + taskImportancyKey);
    List<String>? date =
        prefs.getStringList(email + widget.list_name + taskDateKey);
    List<String>? time =
        prefs.getStringList(email + widget.list_name + taskTimeKey);
    if ((tasks != null) &&
        (Complete != null) &&
        (important != null) &&
        (date != null) &&
        (time != null)) {
      widget.tasksTitle = tasks;
      widget.isTasksComplete = Complete.map((e) => e == "true").toList();
      widget.isTasksImportant = important.map((e) => e == "true").toList();
      widget.tasksDate = date;
      widget.tasksTime = time;
    }
  }

  saveTaskImportancyLocally(index) async {
    final SharedPreferences prefs = await _prefs;
    String email = (prefs.getString(activeEmailKey))!;
    List<String> isTasksImportantString = [];
    widget.isTasksImportant.forEach((item) => item == true
        ? isTasksImportantString.add("ture")
        : isTasksImportantString.add("false"));
    Future<bool> sucess = prefs.setStringList(
        email + widget.list_name + taskImportancyKey, isTasksImportantString);
  }

  saveTaskCompletionLocally(index) async {
    final SharedPreferences prefs = await _prefs;
    String email = (prefs.getString(activeEmailKey))!;
    List<String> isTasksCompleteString = [];
    widget.isTasksComplete.forEach((item) => item == true
        ? isTasksCompleteString.add("ture")
        : isTasksCompleteString.add("false"));
    prefs.setStringList(
        email + widget.list_name + taskCompletionKey, isTasksCompleteString);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.tasksTitle.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(widget.tasksTitle[index]),
            leading: IconButton(
                icon: widget.isTasksComplete[index]
                    ? Icon(Icons.check_circle)
                    : Icon(Icons.circle_outlined),
                onPressed: () async {
                  setState(() {
                    widget.isTasksComplete[index] =
                        !widget.isTasksComplete[index];
                  });
                  await saveTaskCompletionLocally(index);
                }),
            subtitle:
                Text(widget.tasksDate[index] + " " + widget.tasksTime[index]),
            trailing: IconButton(
                icon: widget.isTasksImportant[index]
                    ? Icon(Icons.star)
                    : Icon(Icons.star_border),
                onPressed: () async {
                  setState(() {
                    widget.isTasksImportant[index] =
                        !widget.isTasksImportant[index];
                  });
                  await saveTaskImportancyLocally(index);
                }),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskMainScreen(
                          task_name: widget.tasksTitle[index]))).then((_) {
                getTaskList();
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
