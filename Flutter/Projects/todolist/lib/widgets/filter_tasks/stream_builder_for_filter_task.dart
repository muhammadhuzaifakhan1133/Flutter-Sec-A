import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/list_main_screen/task_list_view.dart';
import 'package:todolist/widgets/filter_tasks/choose_query.dart';
import 'package:todolist/widgets/widget_when_no_data.dart';

StreamBuilder streamBuilderForFilterTask({
  required String email,
  required bool descending,
  required String filterKey,
  required String screen,
  required String sortBy,
  required String textWhenNoData,
  required IconData iconWhenNoData,
  required Color iconColor,
}) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection("lists")
        .where("email", isEqualTo: email)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Center(child: Text("Something went wrong"));
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      List<QueryDocumentSnapshot> listDocs = snapshot.data!.docs;
      if (listDocs.isEmpty) {
        return Center(
            child: widgetWhenNoData(
          icon: iconWhenNoData,
          color: iconColor,
          text: textWhenNoData,
        ));
      }
      List<StreamBuilder> expansionTiles =
          listDocs.map((QueryDocumentSnapshot doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String listName = data["name"];
        return StreamBuilder<QuerySnapshot>(
          stream: chooseQuery(
              listID: doc.id,
              screen: screen,
              sortBy: sortBy,
              filterKey: filterKey,
              descending: descending),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot2) {
            if (snapshot2.hasError) {
              return const Center(child: Text("Something went wrong"));
            }
            if (snapshot2.connectionState == ConnectionState.waiting) {
              return const Center(child: SizedBox());
            }
            // if (snapshot2.data!.docs.isEmpty) {
            //   return Center(
            //       child: widgetWhenNoData(
            //           icon: iconWhenNoData,
            //           color: iconColor,
            //           text: textWhenNoData,
            //           topPadding: 200));
            // }
            List<Widget> tasksOfList = taskListView(
              snapshot: snapshot2,
              context: context,
            );
            if (tasksOfList.isNotEmpty) {
              return ExpansionTile(
                  initiallyExpanded: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  iconColor: Colors.black,
                  title: Text(
                    listName,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  children: tasksOfList);
            }
            return const SizedBox();
          },
        );
      }).toList();
      return ListView(
        children: expansionTiles,
      );
    },
  );
}
