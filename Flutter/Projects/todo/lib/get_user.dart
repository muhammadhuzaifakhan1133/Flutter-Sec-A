import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetUser extends StatefulWidget {
  const GetUser({Key? key}) : super(key: key);

  @override
  State<GetUser> createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc("WAzTzz7Y8JnLot0FBJJa").get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("User does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data!["full_name"]);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
