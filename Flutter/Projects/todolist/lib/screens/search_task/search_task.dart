import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';
import 'package:todolist/widgets/task_card.dart';
import 'package:todolist/widgets/text_field.dart';

class SearchTask extends StatefulWidget {
  const SearchTask({Key? key}) : super(key: key);

  @override
  State<SearchTask> createState() => _SearchTaskState();
}

class _SearchTaskState extends State<SearchTask> {
  List<String> suggestions = [];
  List<String> taskIDs = [];
  List<TaskValues> tasksValues = [];

  _getTaskNames() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection("tasks");
    QuerySnapshot docs = await collection.get();
    List<QueryDocumentSnapshot> docSnapshots = docs.docs;
    for (QueryDocumentSnapshot docSnapshot in docSnapshots) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      TaskValues taskValues = TaskValues(
          name: TextEditingController(text: data["name"]),
          complete: data["complete"],
          important: data["important"],
          date: data["date"] != null ? DateTime.parse(data["date"]) : null,
          time: data["time"]?.toDate());
    }
  }

  Future<String> getListName() async {}

  @override
  void initState() {
    super.initState();
    (() async {
      await _getTaskNames();
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            children: [
              textFieldWidget(
                  size: size,
                  radius: 15,
                  widthPercent: 0.98,
                  prefixIcon: Icons.search,
                  hintText: "Search your tasks",
                  onChanged: (String value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        suggestions = taskNames
                            .where((element) => element.contains(value))
                            .toList();
                      });
                    } else {
                      setState(() {
                        suggestions = [];
                      });
                    }
                  }),
              Expanded(
                child: ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (BuildContext context, int index) {
                    taskCard(
                        context: context,
                        taskValues: taskValues,
                        taskID: taskID,
                        showListNameAsSubtitle: true);
                    return ListTile(
                      title: Text(suggestions[index]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
