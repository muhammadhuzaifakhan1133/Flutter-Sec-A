import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/is_sign_in_with_google.dart';
import 'package:todolist/functions/remove_active_user.dart';
import 'package:todolist/screens/login/login_text_fields_errors.dart';
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
  DocumentReference doc = users.doc(documentID);
  doc.set({
    'name': name,
  });
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
  logout(context: context, deleteAccount: true);
  deleteDocument(collectionID: "users", documentID: documentID);
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
    Navigator.of(context, rootNavigator: true).pop();
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }
  if (await isSignInWithGoogle()) {
    await GoogleSignIn().disconnect();
  }
  if (deleteAccount) {
    User? user = FirebaseAuth.instance.currentUser;
    user!.delete();
  } else {
    FirebaseAuth.instance.signOut();
  }
  await removeActiveUser();
  Navigator.of(context, rootNavigator: true).pop();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Welcome()),
      (route) => false);
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
