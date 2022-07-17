import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/list_main_screen/rename_list_dialog.dart';
import 'package:todolist/screens/list_main_screen/screen_title.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';
import 'package:todolist/widgets/create_rename_list_dialog.dart';
import 'package:todolist/widgets/popup_menu_button.dart';

// ignore: must_be_immutable
class ListMainScreen extends StatefulWidget {
  ListMainScreen({required this.listId, required this.listName, Key? key})
      : super(key: key);
  String listId;
  String listName;
  @override
  State<ListMainScreen> createState() => _ListMainScreenState();
}

class _ListMainScreenState extends State<ListMainScreen> {
  TextEditingController renameController = TextEditingController();
  late CollectionReference tasks;

  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    (() async {
      tasks = FirebaseFirestore.instance
          .collection("users/${user?.email}/lists/${widget.listId}/tasks");
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: backButton(context),
        actions: [
          popupMenuButton(
              setState: setState,
              renameController: renameController,
              widget: widget,
              email: (user?.email)!)
        ],
      ),
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listScreenTitle(
                  context: context,
                  renameController: renameController,
                  widget: widget,
                  email: user?.email,
                  setState: setState),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: tasks.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text("Something went wrong",
                                style: TextStyle(fontSize: 23)));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white));
                      }
                      return ListView(
                          children: taskListView(
                              snapshot: snapshot,
                              user: user,
                              listId: widget.listId));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
