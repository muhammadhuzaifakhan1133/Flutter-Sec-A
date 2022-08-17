import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> chooseQueryForListMainScreen(
    {required String listID,
    required String sortBy,
    required bool descending}) {
  Stream<QuerySnapshot> query;
  if (sortBy == "normal") {
    query = FirebaseFirestore.instance
        .collection("tasks")
        .where("listID", isEqualTo: listID)
        .orderBy("complete")
        .snapshots();
  } else {
    query = FirebaseFirestore.instance
        .collection("tasks")
        .where("listID", isEqualTo: listID)
        .orderBy("complete")
        .orderBy(sortBy, descending: descending)
        .snapshots();
  }
  return query;
}
