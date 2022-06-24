import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/home/profile_bar.dart';
import 'package:class1/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  String email = '';
  String password = '';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getActiveUser() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      name = prefs.getString(activeNameKey)!;
      email = prefs.getString(activeEmailKey)!;
      password = prefs.getString(activePasswordKey)!;
    });
  }

  @override
  void initState() {
    super.initState();
    (() async {
      await getActiveUser();
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileBar(email: email, name: name, password: password),
          ],
        ),
      ),
    );
  }
}
