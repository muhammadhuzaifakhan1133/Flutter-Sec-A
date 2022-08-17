import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/widgets/filter_tasks/stream_builder_for_filter_task.dart';
import 'package:todolist/widgets/sort_menu_item.dart';
import 'package:todolist/widgets/sort_status_row.dart';

class CompletedTasks extends StatefulWidget {
  CompletedTasks(
      {this.sortBy = "normal",
      this.descending = false,
      this.sortKey = "",
      Key? key})
      : super(key: key);
  String sortBy;
  bool descending;
  String sortKey;
  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  Color? getBgColor() {
    return Colors.green[200];
  }

  Color? getThemeColor() {
    return Colors.green[700];
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: backButton(context, getThemeColor()),
        backgroundColor: getBgColor(),
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: getThemeColor(),
              ),
              itemBuilder: (context) => [
                    sortMenuItem(context, widget, setState, completeSort: false)
                  ])
        ],
      ),
      backgroundColor: getBgColor(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Completed",
                style: TextStyle(
                    color: getThemeColor(),
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
          ),
          SizedBox(height: 8),
          if (widget.sortBy != "normal")
            sortStatusRow(widget, setState, color: getThemeColor()),
          Expanded(
              child: streamBuilderForFilterTask(
            email: (user?.email)!,
            screen: "complete",
            filterKey: "complete",
            sortBy: widget.sortBy,
            descending: widget.descending,
            textWhenNoData: "Your Completed tasks will show up here",
            iconWhenNoData: Icons.check_circle,
            iconColor: Colors.white,
          )),
        ],
      ),
    );
  }
}
