import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/new_or_edit_task/new_or_edit_task.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

taskListView(
    {required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
    required String listID}) {
  return snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    TaskValues taskValues = TaskValues(
        name: data["name"],
        complete: data["complete"],
        important: data["important"],
        date: data["date"],
        time: data["time"]);
    return Column(
      children: [
        InkWell(
          onTap: () {
            NewOrEditTask(
                listID: listID,
                name: taskValues.name!,
                complete: taskValues.complete!,
                important: taskValues.important!,
                date: taskValues.date,
                time: taskValues.time);
          },
          child: Card(
            child: ListTile(
                tileColor: Colors.white,
                leading: IconButton(
                    onPressed: () {
                      changeTaskCompletency(
                          taskID: document.id, value: taskValues.complete!);
                    },
                    icon: taskValues.complete!
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                          )
                        : Icon(Icons.circle_outlined)),
                title: Text(taskValues.name!),
                subtitle: Row(children: [
                  Text(taskValues.time.toString()),
                  SizedBox(width: 5),
                  Text(taskValues.date.toString()),
                ]),
                trailing: IconButton(
                    onPressed: () {
                      changeTaskImportancy(
                          taskID: document.id, value: taskValues.important!);
                    },
                    icon: taskValues.important!
                        ? Icon(
                            Icons.star,
                            color: Colors.blue,
                          )
                        : Icon(Icons.star_border))),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }).toList();
}
