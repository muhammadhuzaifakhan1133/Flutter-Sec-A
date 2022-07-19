import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';

class FilterTasks extends StatelessWidget {
  const FilterTasks({required this.filterKey, Key? key}) : super(key: key);
  final String filterKey;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference lists =
        FirebaseFirestore.instance.collection("users/${user?.email}/lists");
    return Scaffold(
        appBar: AppBar(title: Text("Completed Tasks")),
        body: StreamBuilder<QuerySnapshot>(
            stream: lists.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text("Something went wrong",
                        style: TextStyle(fontSize: 23)));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(
                            "users/${user?.email}/lists/${document.id}/tasks")
                        .where(filterKey, isEqualTo: true)
                        .snapshots(),
                    builder: (context, snapshot2) {
                      if (snapshot2.hasError) {
                        return Center(
                            child: Text("Something went wrong",
                                style: TextStyle(fontSize: 23)));
                      }
                      if (snapshot2.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      // List data -- > {"name":listname}
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      List<Column> tasksOfList = taskListView(
                          snapshot: snapshot2, listId: document.id, user: user);
                      if (tasksOfList.isNotEmpty) {
                        return ExpansionTile(
                            initiallyExpanded: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            iconColor: Colors.black,
                            title: Text(
                              data["name"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            children: tasksOfList);
                      }
                      return SizedBox();
                    },
                  );
                }).toList(),
              );
            }));
  }
}
