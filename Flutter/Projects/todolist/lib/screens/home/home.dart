import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/screens/home/bottom_app_bar.dart';
import 'package:todolist/screens/home/create_new_list.dart';
import 'package:todolist/screens/home/profile_tile.dart';
import 'package:todolist/screens/list_main_screen/list_main_screen.dart';
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
  late CollectionReference lists;
  User? user;
  bool? isDeviceConnected;
  @override
  void initState() {
    (() async {
      User? user = FirebaseAuth.instance.currentUser;
      lists =
          FirebaseFirestore.instance.collection("users/${user?.email}/lists");
    })();
    setState(() {
      (() async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
      })();
    });
    super.initState();
  }

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
                    setState: setState,
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
                  email: user.email,
                  isDeviceConnected: isDeviceConnected),
            ),
            Expanded(
              child: Center(
                child: FutureBuilder<QuerySnapshot>(
                  future: lists.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text("Something went wrong",
                              style: TextStyle(fontSize: 23)));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
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
                                        listId: document.id,
                                        listName: data["name"]))).then((_) {
                              setState(() {});
                            });
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        )));
  }
}
