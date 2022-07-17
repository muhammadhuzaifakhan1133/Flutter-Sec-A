import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/list_main_screen.dart';

ListView listListView(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot, BuildContext context) {
  return ListView(
    children: snapshot.data!.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return ListTile(
        leading: const Icon(
          Icons.format_list_bulleted_outlined,
          color: Color.fromARGB(255, 132, 92, 139),
        ),
        title: Text(data["name"]),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ListMainScreen(
                      listId: document.id, listName: data["name"])));
        },
      );
    }).toList(),
  );
}
