import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/functions/remove_active_user.dart';
import 'package:todolist/screens/welcome/welcome.dart';

class Home extends StatefulWidget {
  Home({required this.name, required this.email, Key? key}) : super(key: key);
  String? name;
  String? email;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  logout() async {
    removeActiveUser();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Welcome()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.name}"),
          Text("${widget.email}"),
          ElevatedButton(
              onPressed: () {
                logout();
                FirebaseAuth.instance.signOut();
              },
              child: Text("Log out"))
        ],
      )),
    );
  }
}
