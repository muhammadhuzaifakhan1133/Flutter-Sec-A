import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';
import 'package:todolist/widgets/task_card.dart';

taskListView(
    {required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
    required BuildContext context}) {
  return snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    TaskValues taskValues = TaskValues(
        name: TextEditingController(text: data["name"]),
        complete: data["complete"],
        important: data["important"],
        date: data["date"] != null ? DateTime.parse(data["date"]) : null,
        time: data["time"]?.toDate());

    return taskCard(
        context: context,
        listID: data["listID"],
        taskValues: taskValues,
        taskID: document.id);
  }).toList();
}
