import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/list_main_screen/choose_stream.dart';
import 'package:todolist/screens/list_main_screen/screen_title.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';
import 'package:todolist/screens/new_or_edit_task/new_or_edit_task.dart';
import 'package:todolist/widgets/popup_menu_button.dart';
import 'package:todolist/widgets/sort_status_row.dart';

// ignore: must_be_immutable
class ListMainScreen extends StatefulWidget {
  ListMainScreen(
      {required this.listID,
      required this.listName,
      this.sortBy = "normal",
      this.sortKey = "",
      this.descending = false,
      Key? key})
      : super(key: key);
  String listID;
  String listName;
  String sortBy;
  String sortKey;
  bool descending;
  @override
  State<ListMainScreen> createState() => _ListMainScreenState();
}

class _ListMainScreenState extends State<ListMainScreen> {
  TextEditingController renameController = TextEditingController();
  Color? bgColor = Colors.blue[200];
  Color? themeColor = Colors.blueAccent[700];

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewOrEditTask(
                        listID: widget.listID,
                        name: TextEditingController(),
                        appBarText: "New Task",
                        buttonText: "CREATE",
                      )));
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        leading: backButton(context, themeColor),
        actions: [
          popupMenuButton(
              color: themeColor,
              setState: setState,
              renameController: renameController,
              widget: widget)
        ],
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listScreenTitle(
                  color: themeColor,
                  context: context,
                  renameController: renameController,
                  widget: widget,
                  setState: setState),
              SizedBox(height: 8),
              if (widget.sortBy != "normal")
                sortStatusRow(widget, setState, color: themeColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: chooseQueryForListMainScreen(
                      listID: widget.listID,
                      sortBy: widget.sortBy,
                      descending: widget.descending,
                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
