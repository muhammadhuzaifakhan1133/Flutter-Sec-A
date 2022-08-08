import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/screens/filter_tasks/filter_tasks.dart';
import 'package:todolist/screens/home/bottom_app_bar.dart';
import 'package:todolist/screens/home/create_new_list.dart';
import 'package:todolist/screens/home/list_list_view.dart';
import 'package:todolist/screens/home/profile_tile.dart';
import 'package:todolist/screens/planned_tasks/planned_tasks.dart';
import 'package:todolist/screens/profile.dart/profile.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({required this.name, Key? key}) : super(key: key);
  String? name;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: bottomNavigationBar(
              onNewPressed: () {
                createNewList(
                    context: context,
                    controller: controller,
                    email: (user!.email)!);
              },
              onFolderPressed: () {}),
        ),
        body: SafeArea(
            child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(name: widget.name)));
              },
              child: profileTile(
                  photoUrl: user!.photoURL,
                  name: widget.name,
                  email: user.email),
            ),
            ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.blue),
                title: const Text("Completed Tasks"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterTask(
                                filterKey: "complete",
                                appBarTitle: "Completed Tasks",
                              )));
                }),
            ListTile(
                leading: const Icon(
                  Icons.star_border,
                  color: Colors.pink,
                ),
                title: const Text("Important Tasks"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterTask(
                              filterKey: "important",
                              appBarTitle: "Important Tasks")));
                }),
            ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                  color: Colors.blue,
                ),
                title: const Text("Planned Tasks"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlannedTasks()));
                }),
            ListTile(
                leading: const Icon(Icons.pending, color: Colors.red),
                title: const Text("Unplanned Tasks"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterTask(
                                appBarTitle: "Unplanned Tasks",
                                filterKey: "date",
                                screen: "unplanned",
                              )));
                }),
            Expanded(
              child: Center(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("lists")
                      .where("email", isEqualTo: user.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text("Something went wrong",
                              style: TextStyle(fontSize: 23)));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return listListView(snapshot, context);
                  },
                ),
              ),
            ),
          ],
        )));
  }
}
