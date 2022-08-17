import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/functions/format_date.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';
import 'package:todolist/widgets/task_card.dart';

List<ExpansionTile> separateDateAndFields({
  required AsyncSnapshot<QuerySnapshot> snapshot,
  required BuildContext context,
  required List<String> listIDs,
  required List<String> listNames,
}) {
  List<QueryDocumentSnapshot> taskSnapshots = snapshot.data!.docs;
  List<String> taskDocList = [];
  taskDocList
      .addAll(snapshot.data!.docs.map((QueryDocumentSnapshot doc) => doc.id));
  List<ExpansionTile> childrens = [];
  List<Widget> subChildrens = [];
  String date;
  String previousDate = "";
  for (var i = 0; i < taskDocList.length; i++) {
    Map<String, dynamic> data = taskSnapshots[i].data() as Map<String, dynamic>;
    TaskValues taskValues = TaskValues(
        name: TextEditingController(text: data["name"]),
        complete: data["complete"],
        important: data["important"],
        date: data["date"] != null ? DateTime.parse(data["date"]) : null,
        time: data["time"]?.toDate());
    String listName = listNames[listIDs.indexOf(data["listID"])];
    date = formatDate(taskValues.date);
    if (i == 0) {
      previousDate = formatDate(taskValues.date);
    }
    if (date == previousDate) {
      subChildrens.add(taskCard(
          context: context,
          taskValues: taskValues,
          taskID: taskDocList[i],
          listName: listName,
          showListNameAsSubtitle: true));
    } else {
      childrens.add(ExpansionTile(
        title: Text(previousDate),
        initiallyExpanded: true,
        children: subChildrens,
      ));
      previousDate = date;
      subChildrens = [];
      subChildrens.add(taskCard(
        context: context,
        taskValues: taskValues,
        taskID: taskDocList[i],
        listName: listName,
        showListNameAsSubtitle: true,
      ));
    }
    if (i == taskDocList.length - 1) {
      childrens.add(ExpansionTile(
        title: Text(previousDate),
        initiallyExpanded: true,
        children: subChildrens,
      ));
    }
  }
  return childrens;
}
