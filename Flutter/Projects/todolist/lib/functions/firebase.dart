import 'package:cloud_firestore/cloud_firestore.dart';

saveName({required String documentID, required String name}) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  await users.doc(documentID).set({
    'name': name,
  });
}

Future<String> getUserName({required String documentID}) async {
  DocumentReference user =
      FirebaseFirestore.instance.collection("users").doc(documentID);
  DocumentSnapshot data = await user.get();
  Map<String, dynamic> values = data.data() as Map<String, dynamic>;
  return values["name"];
}
