import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';
import 'package:todolist/widgets/task_card.dart';

List<Widget> taskListView(
    {required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
    required BuildContext context,
    bool filterScreen = false}) {
  List<DocumentSnapshot> tasksDoc = snapshot.data!.docs;
  List<Widget> tasksList = [];
  List<Widget> uncompleteList = [];
  List<Widget> completeList = [];
  Widget taskCard;

  for (var i = 0; i < tasksDoc.length; i++) {
    DocumentSnapshot document = tasksDoc[i];
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    TaskValues taskValues = TaskValues(
        name: TextEditingController(text: data["name"]),
        complete: data["complete"],
        important: data["important"],
        date: data["date"]?.toDate(),
        time: data["time"]?.toDate());

    taskCard = getTaskCard(
        context: context,
        listID: data["listID"],
        taskValues: taskValues,
        taskID: document.id);

    if (filterScreen) {
      tasksList.add(taskCard);
      continue;
    }

    if (!(data["complete"])) {
      uncompleteList.add(taskCard);
    } else {
      completeList.add(taskCard);
    }
  }
  if (!(filterScreen)) {
    if (completeList.isNotEmpty) {
      ExpansionTile completeExpansion = ExpansionTile(
          title: Text("Completed ${completeList.length}",
              style: TextStyle(color: Colors.black)),
          iconColor: Colors.black,
          controlAffinity: ListTileControlAffinity.leading,
          initiallyExpanded: true,
          children: completeList);
      tasksList = uncompleteList + [completeExpansion];
    } else {
      tasksList = uncompleteList;
    }
  }

  return tasksList;
}
