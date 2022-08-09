import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';
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
      Key? key})
      : super(key: key);
  String filterKey;
  String screen;
  String appBarTitle;
  String sortBy;
  String sortKey;
  bool descending;

  @override
  State<FilterTask> createState() => _FilterTaskState();
}

class _FilterTaskState extends State<FilterTask> {
  late Stream<QuerySnapshot> query;

  Stream<QuerySnapshot> chooseQuery({listID}) {
    if (widget.screen == "importantOrComplete") {
      if (widget.sortBy == "normal") {
        query = FirebaseFirestore.instance
            .collection("tasks")
            .where("listID", isEqualTo: listID)
            .where(widget.filterKey, isEqualTo: true)
            .snapshots();
      } else {
        query = FirebaseFirestore.instance
            .collection("tasks")
            .where("listID", isEqualTo: listID)
            .where(widget.filterKey, isEqualTo: true)
            .orderBy(widget.sortBy, descending: widget.descending)
            .snapshots();
      }
    } else if (widget.screen == "unplanned") {
      if (widget.sortBy == "normal") {
        query = FirebaseFirestore.instance
            .collection("tasks")
            .where("listID", isEqualTo: listID)
            .where(widget.filterKey, isNull: true)
            .snapshots();
      } else {
        query = FirebaseFirestore.instance
            .collection("tasks")
            .where("listID", isEqualTo: listID)
            .where(widget.filterKey, isNull: true)
            .orderBy(widget.sortBy, descending: widget.descending)
            .snapshots();
      }
    }
    return query;
  }

  Color? getBgColor() {
    return widget.filterKey == "complete"
        ? Colors.green[200]
        : Colors.pink[200];
  }

  Color? getThemeColor() {
    return widget.filterKey == "complete" ? Colors.green : Colors.pink;
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
                  "${widget.filterKey[0].toUpperCase()}${widget.filterKey.substring(1)}",
                  style: TextStyle(
                      color: getThemeColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ),
            SizedBox(height: 8),
            if (widget.sortBy != "normal")
              sortStatusRow(widget, setState, color: getThemeColor()),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("lists")
                      .where("email", isEqualTo: user?.email)
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
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return StreamBuilder<QuerySnapshot>(
                          stream: chooseQuery(listID: document.id),
                          builder: (context, snapshot2) {
                            if (snapshot2.hasError) {
                              return const Center(
                                  child: Text("Something went wrong",
                                      style: TextStyle(fontSize: 23)));
                            }
                            if (snapshot2.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(child: SizedBox());
                            }

                            // List data -- > {"name":listname}
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;

                            List<Widget> tasksOfList = taskListView(
                              snapshot: snapshot2,
                              context: context,
                            );
                            if (tasksOfList.isNotEmpty) {
                              return ExpansionTile(
                                  initiallyExpanded: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  iconColor: Colors.black,
                                  title: Text(
                                    data["name"],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: tasksOfList);
                            }
                            return const SizedBox();
                          },
                        );
                      }).toList(),
                    );
                  }),
            ),
          ],
        ));
  }
}
