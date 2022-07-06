import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/screens/welcome/welcome.dart';

class Home extends StatefulWidget {
  Home({required this.name, required this.email, Key? key}) : super(key: key);
  String? name;
  String? email;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove("activeEmail");
    prefs.remove("activeName");
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
              },
              child: Text("Log out"))
        ],
      )),
    );
  }
}
