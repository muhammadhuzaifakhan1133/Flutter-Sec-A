import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/widgets/filter_tasks/stream_builder_for_filter_task.dart';
import 'package:todolist/widgets/sort_menu_item.dart';
import 'package:todolist/widgets/sort_status_row.dart';

class ImportantTasks extends StatefulWidget {
  ImportantTasks(
      {this.sortBy = "normal",
      this.descending = false,
      this.sortKey = "",
      Key? key})
      : super(key: key);
  String sortBy;
  bool descending;
  String sortKey;
  @override
  State<ImportantTasks> createState() => _ImportantTasksState();
}

class _ImportantTasksState extends State<ImportantTasks> {
  Color? getBgColor() {
    return Colors.pink[200];
  }

  Color? getThemeColor() {
    return Colors.pink[700];
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
            child: Text("Important",
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
                  screen: "important",
                  filterKey: "important",
                  sortBy: widget.sortBy,
                  descending: widget.descending,
                  iconWhenNoData: Icons.star,
                  textWhenNoData: "Your important task show up here",
                  iconColor: Colors.white)),
        ],
      ),
    );
  }
}
