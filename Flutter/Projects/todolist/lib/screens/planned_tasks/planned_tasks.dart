import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/planned_tasks/separate_date_and_fields.dart';

class PlannedTasks extends StatelessWidget {
  const PlannedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(title: const Text("Planned Tasks")),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("lists")
              .where("email", isEqualTo: user?.email)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            List<String> listIDs = [];
            List<String> listNames = [];
            listIDs.addAll(
                snapshot.data!.docs.map((QueryDocumentSnapshot doc) => doc.id));
            List<QueryDocumentSnapshot> listSnapshots = snapshot.data!.docs;
            listNames
                .addAll(listSnapshots.map((QueryDocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return data["name"];
            }));
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("tasks")
                  .where("listID", whereIn: listIDs)
                  .where("date", isNull: false)
                  .orderBy("date")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> taskSnapshot) {
                if (taskSnapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                }
                if (taskSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView(
                    children: separateDateAndFields(
                        snapshot: taskSnapshot,
                        context: context,
                        listIDs: listIDs,
                        listNames: listNames));
              },
            );
          },
        ));
  }
}
