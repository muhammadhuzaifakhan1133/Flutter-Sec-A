import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/functions/format_date.dart';
import 'package:todolist/functions/format_time.dart';
import 'package:todolist/screens/new_or_edit_task/new_or_edit_task.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

Widget taskCard(
    {required BuildContext context,
    String? listID,
    required TaskValues taskValues,
    String? listName,
    bool planScreen = false,
    required String taskID}) {
  return Column(
    children: [
      InkWell(
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
                        buttonText: "UPDATE",
                        taskID: taskID,
                      )));
        },
        child: Card(
          child: ListTile(
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
              title: Text(taskValues.name!.text),
              subtitle: planScreen
                  ? Text(listName!)
                  : Row(children: [
                      Text(formatTime(taskValues.time)),
                      const SizedBox(width: 5),
                      Text(formatDate(taskValues.date))
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
      ),
      const SizedBox(height: 10),
    ],
  );
}
