import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> chooseQuery(
    {required String listID,
    required String screen,
    required String sortBy,
    required String filterKey,
    required bool descending}) {
  late Stream<QuerySnapshot> query;
  if (screen == "importantOrComplete") {
    if (sortBy == "normal") {
      query = FirebaseFirestore.instance
          .collection("tasks")
          .where("listID", isEqualTo: listID)
          .where(filterKey, isEqualTo: true)
          .snapshots();
    } else {
      query = FirebaseFirestore.instance
          .collection("tasks")
          .where("listID", isEqualTo: listID)
          .where(filterKey, isEqualTo: true)
          .orderBy(sortBy, descending: descending)
          .snapshots();
    }
  } else if (screen == "unplanned" || screen == "planned") {
    if (sortBy == "normal") {
      query = FirebaseFirestore.instance
          .collection("tasks")
          .where("listID", isEqualTo: listID)
          .where(filterKey, isNull: screen == "unplanned" ? true : false)
          .snapshots();
    } else {
      query = FirebaseFirestore.instance
          .collection("tasks")
          .where("listID", isEqualTo: listID)
          .where(filterKey, isNull: true)
          .orderBy(sortBy, descending: descending)
          .snapshots();
    }
  }
  return query;
}
