import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  Future<void> addUser() {
    return users
        .add({
          "full_name": "Huzaifa",
          "company": "Sehat Connection",
          "age": "20"
        })
        .then((value) => print("user added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Add User"),
          onPressed: () {
            addUser();
          },
        ),
      ),
    );
  }
}
