import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/back_button.dart';
import 'package:todolist/screens/planned_tasks/menu_for_group_by.dart';
import 'package:todolist/screens/planned_tasks/separate_date_and_fields.dart';
import 'package:todolist/widgets/filter_tasks/stream_builder_for_filter_task.dart';
import 'package:todolist/widgets/widget_when_no_data.dart';

class PlannedTasks extends StatefulWidget {
  PlannedTasks({this.groupBy = "date", Key? key}) : super(key: key);
  String groupBy;
  @override
  State<PlannedTasks> createState() => _PlannedTasksState();
}

class _PlannedTasksState extends State<PlannedTasks> {
  Color? getBgColor() {
    return Colors.orange[100];
  }

  Color? getThemeColor() {
    return Colors.orange[700];
  }

  Widget widgetWhenNoPlanned() {
    return widgetWhenNoData(
      icon: Icons.calendar_month_outlined,
      text: "Your Planned task show up here",
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: backButton(context, getThemeColor()),
          backgroundColor: getBgColor(),
          actions: [menuForGroupBy(setState, widget, getThemeColor())],
        ),
        backgroundColor: getBgColor(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Planned Tasks",
                  style: TextStyle(
                      color: getThemeColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ),
            SizedBox(height: 8),
            Expanded(
              child: widget.groupBy == "date"
                  ? StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("lists")
                          .where("email", isEqualTo: user?.email)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text("Something went wrong"));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        List<String> listIDs = [];
                        List<String> listNames = [];
                        listIDs.addAll(snapshot.data!.docs
                            .map((QueryDocumentSnapshot doc) => doc.id));
                        if (listIDs.isEmpty) {
                          return widgetWhenNoPlanned();
                        }
                        List<QueryDocumentSnapshot> listSnapshots =
                            snapshot.data!.docs;
                        listNames.addAll(
                            listSnapshots.map((QueryDocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          return data["name"];
                        }));
                        int n = listIDs.length ~/ 10;
                        n += listIDs.length % 10 == 0 ? 0 : 1;
                        for (var i = 0; i < n; i++) {
                          List<String> subList =
                              listIDs.sublist(i * 10, (i * 10) + 10);
                          return StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("tasks")
                                .where("listID", whereIn: subList)
                                .where("date", isNull: false)
                                .orderBy("date")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> taskSnapshot) {
                              if (taskSnapshot.hasError) {
                                return const Center(
                                    child: Text("Something went wrong"));
                              }
                              if (taskSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              if (taskSnapshot.data!.docs.isEmpty) {
                                return widgetWhenNoPlanned();
                              }

                              return ListView(
                                  children: separateDateAndFields(
                                      snapshot: taskSnapshot,
                                      context: context,
                                      listIDs: listIDs,
                                      listNames: listNames));
                            },
                          );
                        }
                        return SizedBox();
                      },
                    )
                  : streamBuilderForFilterTask(
                      email: (user?.email)!,
                      descending: false,
                      filterKey: "date",
                      screen: "planned",
                      sortBy: "normal",
                      iconWhenNoData: Icons.calendar_month_outlined,
                      textWhenNoData: "Your Planned task show up here",
                      iconColor: Colors.white,
                    ),
            ),
          ],
        ));
  }
}
