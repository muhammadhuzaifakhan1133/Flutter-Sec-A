import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';

class FilterTask extends StatelessWidget {
  FilterTask(
      {required this.filterKey,
      required this.appBarTitle,
      this.screen = "importantOrComplete",
      Key? key})
      : super(key: key);
  String filterKey;
  String screen;
  String appBarTitle;
  late Stream<QuerySnapshot> query;

  Stream<QuerySnapshot> chooseQuery({listID}) {
    if (screen == "importantOrComplete") {
      query = FirebaseFirestore.instance
          .collection("tasks")
          .where("listID", isEqualTo: listID)
          .where(filterKey, isEqualTo: true)
          .snapshots();
    } else if (screen == "unplanned") {
      query = FirebaseFirestore.instance
          .collection("tasks")
          .where("listID", isEqualTo: listID)
          .where(filterKey, isNull: true)
          .snapshots();
    }
    return query;
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
            leading: backButton(context, Colors.black),
            backgroundColor: Colors.white,
            title:
                Text(appBarTitle, style: const TextStyle(color: Colors.black))),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("lists")
                .where("email", isEqualTo: user?.email)
                .snapshots(),
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
                    stream: chooseQuery(listID: document.id),
                    builder: (context, snapshot2) {
                      if (snapshot2.hasError) {
                        return const Center(
                            child: Text("Something went wrong",
                                style: TextStyle(fontSize: 23)));
                      }
                      if (snapshot2.connectionState ==
                          ConnectionState.waiting) {
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
