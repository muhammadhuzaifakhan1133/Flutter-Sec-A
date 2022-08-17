import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase/list_and_task.dart';
import 'package:todolist/functions/format_date.dart';
import 'package:todolist/functions/format_time.dart';
import 'package:todolist/functions/date_time_color.dart';
import 'package:todolist/screens/new_or_edit_task/new_or_edit_task.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

Widget taskCard(
    {required BuildContext context,
    String? listID,
    required TaskValues taskValues,
    String? listName,
    bool showListNameAsSubtitle = false,
    required String taskID}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewOrEditTask(
                    listID: listID,
                    name: taskValues.name,
                    complete: taskValues.complete!,
                    important: taskValues.important!,
                    date: taskValues.date,
                    time: taskValues.time,
                    appBarText: "Update Task",
                    buttonText: "SAVE",
                    taskID: taskID,
                  )));
    },
    child: Card(
      child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: Colors.white,
          leading: IconButton(
              onPressed: () async {
                await changeTaskCompletency(
                    taskID: taskID, value: !(taskValues.complete!));
              },
              icon: taskValues.complete!
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.circle_outlined)),
          title: Text(taskValues.name!.text,
              style: TextStyle(
                  decoration: (taskValues.complete!)
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
          subtitle: showListNameAsSubtitle
              ? Text(listName!)
              : Row(children: [
                  Text(formatTime(taskValues.time),
                      style: TextStyle(
                          color:
                              getDateColor(taskValues.date, taskValues.time))),
                  const SizedBox(width: 5),
                  Text(formatDate(taskValues.date),
                      style: TextStyle(
                          color:
                              getDateColor(taskValues.date, taskValues.time)))
                ]),
          trailing: IconButton(
              onPressed: () {
                changeTaskImportancy(
                    taskID: taskID, value: !(taskValues.important!));
              },
              icon: taskValues.important!
                  ? const Icon(
                      Icons.star,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.star_border))),
    ),
  );
}
