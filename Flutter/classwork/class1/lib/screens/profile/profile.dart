import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/profile/profile_area.dart';
import 'package:class1/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({required this.name, required this.email, Key? key})
      : super(key: key);
  String name;
  String email;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(activeNameKey);
    await prefs.remove(activeEmailKey);
    await prefs.remove(activePasswordKey);
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Welcome(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              profileArea(context, widget.name, widget.email),
              Divider(color: Colors.black),
              ListTile(
                onTap: () async {
                  await logout();
                },
                leading: Icon(Icons.logout),
                title: Text("Sign out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
