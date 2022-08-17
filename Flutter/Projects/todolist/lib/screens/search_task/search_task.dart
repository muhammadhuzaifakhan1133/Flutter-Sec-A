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
  List<int> trueIndex = [];
  List<String> taskIDs = []; // Done
  List<String> listIDs = []; // Done
  List<String> listNames = [];
  List<TaskValues> tasksValues = []; // Done
  bool initialValuesProcessing = true;

  getInitialValues() async {
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
          date: data["date"]?.toDate(),
          time: data["time"]?.toDate());
      tasksValues.add(taskValues);
      listIDs.add(data["listID"]);
      taskIDs.add(docSnapshot.id);
      listNames.add(await getListName(data["listID"]));
    }
  }

  Future<String> getListName(String listID) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection("lists").doc(listID).get();
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return data["name"];
  }

  @override
  void initState() {
    super.initState();
    (() async {
      await getInitialValues();
      setState(() {
        initialValuesProcessing = false;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: initialValuesProcessing
          ? const Center(child: CircularProgressIndicator())
          : Padding(
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
                          List<int> indexes = [];
                          if (value.isNotEmpty) {
                            for (var i = 0; i < tasksValues.length; i++) {
                              if (tasksValues[i].name!.text.contains(value)) {
                                indexes.add(i);
                              }
                            }
                            setState(() {
                              trueIndex = indexes;
                            });
                          } else {
                            setState(() {
                              trueIndex = [];
                            });
                          }
                        }),
                    Expanded(
                      child: ListView.builder(
                        itemCount: trueIndex.length,
                        itemBuilder: (BuildContext context, int index) {
                          return getTaskCard(
                              context: context,
                              taskValues: tasksValues[trueIndex[index]],
                              taskID: taskIDs[trueIndex[index]],
                              listID: listIDs[trueIndex[index]],
                              showListNameAsSubtitle: true,
                              listName: listNames[trueIndex[index]]);
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
