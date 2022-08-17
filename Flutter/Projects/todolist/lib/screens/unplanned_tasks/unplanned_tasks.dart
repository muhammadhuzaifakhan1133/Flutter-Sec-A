import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/widgets/filter_tasks/stream_builder_for_filter_task.dart';
import 'package:todolist/widgets/sort_menu_item.dart';
import 'package:todolist/widgets/sort_status_row.dart';

class UnplannedTasks extends StatefulWidget {
  UnplannedTasks(
      {this.sortBy = "normal",
      this.descending = false,
      this.sortKey = "",
      Key? key})
      : super(key: key);
  String sortBy;
  bool descending;
  String sortKey;
  @override
  State<UnplannedTasks> createState() => _UnplannedTasksState();
}

class _UnplannedTasksState extends State<UnplannedTasks> {
  Color? getBgColor() {
    return Colors.red[200];
  }

  Color? getThemeColor() {
    return Colors.red[700];
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
            child: Text("Unplanned",
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
                  screen: "unplanned",
                  filterKey: "date",
                  sortBy: widget.sortBy,
                  descending: widget.descending,
                  textWhenNoData: "Your unplanned tasks will show up here",
                  iconWhenNoData: Icons.calendar_today_sharp,
                  iconColor: Colors.white)),
        ],
      ),
    );
  }
}
