import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

Future<bool> checkEmailVerified() async {
  User user = FirebaseAuth.instance.currentUser!;
  await user.reload();
  if (user.emailVerified) {
    return true;
  }
  return false;
}

Future<bool> sendVerificationEmail(context) async {
  final auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  try {
    await user?.sendEmailVerification();
    return true;
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return false;
  }
}
