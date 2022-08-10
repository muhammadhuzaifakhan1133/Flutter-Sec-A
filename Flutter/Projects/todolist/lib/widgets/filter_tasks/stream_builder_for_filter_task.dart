import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';
import 'package:todolist/widgets/filter_tasks/choose_query.dart';

StreamBuilder streamBuilderForFilterTask(
    {required String email,
    required bool descending,
    required String filterKey,
    required String screen,
    required String sortBy}) {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("lists")
          .where("email", isEqualTo: email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child:
                  Text("Something went wrong", style: TextStyle(fontSize: 23)));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return StreamBuilder<QuerySnapshot>(
              stream: chooseQuery(
                  listID: document.id,
                  descending: descending,
                  filterKey: filterKey,
                  screen: screen,
                  sortBy: sortBy),
              builder: (context, snapshot2) {
                if (snapshot2.hasError) {
                  return const Center(
                      child: Text("Something went wrong",
                          style: TextStyle(fontSize: 23)));
                }
                if (snapshot2.connectionState == ConnectionState.waiting) {
                  return const Center(child: SizedBox());
                }

                // List data -- > {"name":listname}
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                List<Widget> tasksOfList = taskListView(
                  snapshot: snapshot2,
                  context: context,
                );
                if (tasksOfList.isNotEmpty) {
                  return ExpansionTile(
                      initiallyExpanded: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      iconColor: Colors.black,
                      title: Text(
                        data["name"],
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      children: tasksOfList);
                }
                return const SizedBox();
              },
            );
          }).toList(),
        );
      });
}
