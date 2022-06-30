import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser() {
  // Call the user's CollectionReference to add a new user
  return users
      .add({
        'full_name': "Muhmmad Huzaifa Khan", // John Doe
        'company': "Flutter Co.", // Stokes and Sons
        'age': "20"
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                addUser();
              },
              child: const Text("add user"))),
    );
  }
}
