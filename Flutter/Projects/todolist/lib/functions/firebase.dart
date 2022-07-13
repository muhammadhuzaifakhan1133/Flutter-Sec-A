import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/screens/login/login_text_fields_errors.dart';
import 'package:todolist/screens/signup/signup_text_fields_errors.dart';

Future<dynamic> addUser(
    {required BuildContext context,
    required setState,
    required String email,
    required String password,
    required SignUpTextFieldErrors errors}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      setState(() {
        errors.emailError = "The account already exists for that email.";
      });
      return false;
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return false;
  }
}

Future<bool> logIn(
    {required setState,
    required String email,
    required String password,
    required LogInTextFieldErrors errors}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      setState(() {
        errors.emailError = 'No user found for that email.';
      });
    } else if (e.code == 'wrong-password') {
      setState(() {
        errors.passwordError = 'Wrong password provided for that user.';
      });
    }
    return false;
  }
}

Future<void> saveUserName(
    {required String documentID, required String name}) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  await users.doc(documentID).set({
    'name': name,
  }, SetOptions(merge: true));
}

Future<String> getUserName({required String email}) async {
  DocumentReference user =
      FirebaseFirestore.instance.collection("users").doc(email);
  DocumentSnapshot data = await user.get();
  Map<String, dynamic> values = data.data() as Map<String, dynamic>;
  return values["name"];
}

Future<bool> checkEmailVerified() async {
  User user = FirebaseAuth.instance.currentUser!;
  if (await InternetConnectionChecker().hasConnection) {
    await user.reload();
  }
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

Future<String> saveListName(
    {required String email,
    required String newList,
    required List<String> existListIds}) async {
  CollectionReference lists = FirebaseFirestore.instance.collection("lists");
  DocumentReference doc = await lists.add({"name": newList});
  String newListId = doc.id;
  existListIds.add(newListId);

  // if this is the first list of user
  if (existListIds.length == 1) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .set({"lists": existListIds}, SetOptions(merge: true));
  } else {
    FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .update({"lists": existListIds});
  }
  return newListId;
}

Future<Map<String, List<String>>> getListIdsAndNames(
    {required String email}) async {
  List<String> listIds = [];
  List<String> listNames = [];
  DocumentReference user =
      FirebaseFirestore.instance.collection("users").doc(email);
  DocumentSnapshot data = await user.get();
  Map<String, dynamic> values = data.data() as Map<String, dynamic>;
  List<dynamic> ids = values["lists"] ?? [];
  listIds = ids.map((e) => e.toString()).toList();
  for (var i = 0; i < listIds.length; i++) {
    DocumentSnapshot lists = await FirebaseFirestore.instance
        .collection("lists")
        .doc(listIds[i])
        .get();
    Map<String, dynamic> data = lists.data() as Map<String, dynamic>;
    listNames.add(data["name"] as String);
  }
  return {"listIds": listIds, "listNames": listNames};
}

Future<List<String>> getEmailProviders(String emailAddress, context) async {
  try {
    // Fetch sign-in methods for the email address
    final list =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
    return list;
  } catch (error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString())));
  }
  return [];
}
