import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/widgets/filter_tasks/stream_builder_for_filter_task.dart';
import 'package:todolist/widgets/sort_menu_item.dart';
import 'package:todolist/widgets/sort_status_row.dart';

class FilterTask extends StatefulWidget {
  FilterTask(
      {required this.filterKey,
      required this.appBarTitle,
      this.screen = "importantOrComplete",
      this.sortBy = "normal",
      this.sortKey = "",
      this.descending = false,
      this.enableSortOptions = true,
      Key? key})
      : super(key: key);
  String filterKey;
  String screen;
  String appBarTitle;
  String sortBy;
  String sortKey;
  bool descending;
  bool enableSortOptions;

  @override
  State<FilterTask> createState() => _FilterTaskState();
}

class _FilterTaskState extends State<FilterTask> {
  Color? getBgColor() {
    if (widget.screen != "unplanned") {
      return widget.filterKey == "complete"
          ? Colors.green[200]
          : Colors.pink[200];
    } else {
      return Colors.red[200];
    }
  }

  Color? getThemeColor() {
    if (widget.screen != "unplanned") {
      return widget.filterKey == "complete" ? Colors.green : Colors.pink;
    } else {
      return Colors.red[700];
    }
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
            if (widget.enableSortOptions)
              PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: getThemeColor(),
                  ),
                  itemBuilder: (context) => [
                        sortMenuItem(context, widget, setState,
                            complete:
                                widget.filterKey == "complete" ? false : true,
                            important:
                                widget.filterKey == "important" ? false : true)
                      ])
          ],
        ),
        backgroundColor: getBgColor(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                  widget.filterKey != "date"
                      ? "${widget.filterKey[0].toUpperCase()}${widget.filterKey.substring(1)}"
                      : "Unplanned Tasks",
                  style: TextStyle(
                      color: getThemeColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ),
            SizedBox(height: 8),
            if (widget.sortBy != "normal" && widget.enableSortOptions)
              sortStatusRow(widget, setState, color: getThemeColor()),
            Expanded(
                child: streamBuilderForFilterTask(
                    email: (user?.email)!,
                    screen: widget.screen,
                    filterKey: widget.filterKey,
                    sortBy: widget.sortBy,
                    descending: widget.descending)),
          ],
        ));
  }
}
