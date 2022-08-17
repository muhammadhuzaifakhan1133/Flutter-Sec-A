import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';

Future<String> saveListName(
    {required String email, required String newListName}) async {
  CollectionReference lists = FirebaseFirestore.instance.collection("lists");
  DocumentReference doc =
      await lists.add({"email": email, "name": newListName});
  dynamic newListId = doc.id;
  return newListId;
}

Future<void> renameList(
    {required String listID, required String newName}) async {
  CollectionReference lists = FirebaseFirestore.instance.collection("lists");
  lists.doc(listID).update({"name": newName});
}

Future<void> deleteList({required String listID}) async {
  CollectionReference lists = FirebaseFirestore.instance.collection("lists");
  await lists.doc(listID).delete();
  QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
      .collection("tasks")
      .where("listID", isEqualTo: listID)
      .get();
  for (QueryDocumentSnapshot taskDoc in query.docs) {
    await deleteTask(taskID: taskDoc.id);
  }
}

Future<void> deleteTask({required String taskID}) async {
  CollectionReference lists = FirebaseFirestore.instance.collection("tasks");
  lists.doc(taskID).delete();
}

Future<void> changeTaskImportancy(
    {required String taskID, required bool value}) async {
  CollectionReference tasks = FirebaseFirestore.instance.collection("tasks");
  tasks.doc(taskID).update({"important": value});
}

Future<void> changeTaskCompletency(
    {required String taskID, required bool value}) async {
  CollectionReference tasks = FirebaseFirestore.instance.collection("tasks");
  tasks.doc(taskID).update({"complete": value});
}

Future<void> addTask({
  required String listID,
  required TaskValues taskValues,
}) async {
  CollectionReference tasks = FirebaseFirestore.instance.collection("tasks");
  tasks.add({
    "listID": listID,
    "name": taskValues.name!.text,
    "complete": taskValues.complete,
    "important": taskValues.important,
    "date": taskValues.date != null
        ? taskValues.date.toString().split(" ")[0]
        : null,
    "time": taskValues.time
  });
}

Future<void> updateTask({
  required String taskID,
  required TaskValues taskValues,
}) async {
  CollectionReference tasks = FirebaseFirestore.instance.collection("tasks");
  tasks.doc(taskID).update({
    "name": taskValues.name!.text,
    "complete": taskValues.complete,
    "important": taskValues.important,
    "date": taskValues.date != null
        ? taskValues.date.toString().split(" ")[0]
        : null,
    "time": taskValues.time
  });
}
