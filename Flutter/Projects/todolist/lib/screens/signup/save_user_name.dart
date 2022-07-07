import 'package:cloud_firestore/cloud_firestore.dart';

saveName(email, name) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  await users.doc(email).set({
    'name': name,
  });
}
