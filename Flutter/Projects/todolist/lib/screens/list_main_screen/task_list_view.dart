import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase.dart';

taskListView(
    {required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
    User? user,
    required listId}) {
  return snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    print(data);
    return Column(
      children: [
        Card(
          child: ListTile(
              tileColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    changeTaskCompletency(
                        email: (user?.email)!,
                        listID: listId,
                        taskID: document.id,
                        value: !(data["complete"]));
                  },
                  icon: data["complete"]
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        )
                      : Icon(Icons.circle_outlined)),
              title: Text(data["name"]),
              subtitle: Row(children: [
                Text(data["time"]),
                SizedBox(width: 5),
                Text(data["date"]),
              ]),
              trailing: IconButton(
                  onPressed: () {
                    changeTaskImportancy(
                        email: (user?.email)!,
                        listID: listId,
                        taskID: document.id,
                        value: !(data["important"]));
                  },
                  icon: data["important"]
                      ? Icon(
                          Icons.star,
                          color: Colors.blue,
                        )
                      : Icon(Icons.star_border))),
        ),
        SizedBox(height: 10),
      ],
    );
  }).toList();
}
