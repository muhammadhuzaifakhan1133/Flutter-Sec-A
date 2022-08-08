import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/list_main_screen/screen_title.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';
import 'package:todolist/screens/new_or_edit_task/new_or_edit_task.dart';
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

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.blue),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewOrEditTask(
                        listID: widget.listId,
                        name: TextEditingController(),
                        appBarText: "New Task",
                        buttonText: "CREATE",
                      )));
        },
      ),
      appBar: AppBar(
        elevation: 0,
        leading: backButton(context, Colors.white),
        actions: [
          popupMenuButton(
              setState: setState,
              renameController: renameController,
              widget: widget)
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
                  setState: setState),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("tasks")
                        .where("listID", isEqualTo: widget.listId)
                        .snapshots(),
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
                        context: context,
                      ));
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
