import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';

class CompleteOrImportantTasks extends StatelessWidget {
  const CompleteOrImportantTasks({required this.filterKey, Key? key})
      : super(key: key);
  final String filterKey;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference lists = FirebaseFirestore.instance.collection("lists");
    return Scaffold(
        appBar: AppBar(
            leading: backButton(context, Colors.black),
            backgroundColor: Colors.white,
            title: Text(
                "${filterKey[0].toUpperCase()}${filterKey.substring(1).toLowerCase()} Tasks",
                style: TextStyle(color: Colors.black))),
        body: StreamBuilder<QuerySnapshot>(
            stream: lists.where("email", isEqualTo: user?.email).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                    child: Text("Something went wrong",
                        style: TextStyle(fontSize: 23)));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("tasks")
                        .where("listID", isEqualTo: document.id)
                        .where(filterKey, isEqualTo: true)
                        .snapshots(),
                    builder: (context, snapshot2) {
                      if (snapshot2.hasError) {
                        return const Center(
                            child: Text("Something went wrong",
                                style: TextStyle(fontSize: 23)));
                      }
                      if (snapshot2.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // List data -- > {"name":listname}
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      List<Column> tasksOfList = taskListView(
                          snapshot: snapshot2, listID: document.id);
                      if (tasksOfList.isNotEmpty) {
                        return ExpansionTile(
                            initiallyExpanded: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            iconColor: Colors.black,
                            title: Text(
                              data["name"],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            children: tasksOfList);
                      }
                      return const SizedBox();
                    },
                  );
                }).toList(),
              );
            }));
  }
}
