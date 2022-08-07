import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/push_and_remove_until.dart';
import 'package:todolist/functions/remove_active_user.dart';
import 'package:todolist/screens/login/login_text_fields_errors.dart';
import 'package:todolist/screens/new_or_edit_task/task_values.dart';
import 'package:todolist/screens/signup/signup_text_fields_errors.dart';
import 'package:todolist/screens/welcome/welcome.dart';
import 'package:todolist/widgets/loading_widget.dart';

Future<dynamic> addUser(
    {required BuildContext context,
    required setState,
    required String email,
    required String password,
    required SignUpTextFieldErrors errors}) async {
  try {
    // ignore: unused_local_variable
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
    // ignore: unused_local_variable
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
  DocumentReference doc = users.doc(documentID);
  doc.set({'name': name});
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
    Fluttertoast.showToast(msg: "Verification link sent");
    return true;
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return false;
  }
}

Future<bool> checkIfDocExist({required String documentID}) async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");
  DocumentSnapshot doc = await collectionReference.doc(documentID).get();
  return doc.exists;
}

deleteAccount(
    {required BuildContext context, required String documentID}) async {
  if (!(await InternetConnectionChecker().hasConnection)) {
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }
  await logout(context: context, deleteAccount: true);
  await deleteDocument(collectionID: "users", documentID: documentID);
}

Future<void> deleteDocument(
    {required String collectionID, required String documentID}) async {
  DocumentReference doc =
      FirebaseFirestore.instance.collection(collectionID).doc(documentID);
  await doc.delete();
}

logout({required BuildContext context, bool deleteAccount = false}) async {
  circleProgressDialog(context);
  if (!(await InternetConnectionChecker().hasConnection)) {
    closeDialog(context);
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }

  await GoogleSignIn().signOut();

  if (deleteAccount) {
    User? user = FirebaseAuth.instance.currentUser;
    user!.delete();
  } else {
    FirebaseAuth.instance.signOut();
  }
  await removeActiveUser();
  // ignore: use_build_context_synchronously
  closeDialog(context);
  // ignore: use_build_context_synchronously
  pushAndRemoveUntil(context, const Welcome());
}

Future<String> saveListName(
    {required String email, required String newListName}) async {
  CollectionReference lists = FirebaseFirestore.instance.collection("lists");
  DocumentReference doc =
      await lists.add({"email": email, "name": newListName});
  dynamic newListId = doc.id;
  return newListId;
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

Future<void> renameList(
    {required String listID, required String newName}) async {
  CollectionReference lists = FirebaseFirestore.instance.collection("lists");
  lists.doc(listID).update({"name": newName});
}

Future<void> deleteList({required String listID}) async {
  CollectionReference lists = FirebaseFirestore.instance.collection("lists");
  lists.doc(listID).delete();
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
    "name": taskValues.name,
    "complete": taskValues.complete,
    "important": taskValues.important,
    "date": taskValues.date,
    "time": taskValues.time
  });
}
