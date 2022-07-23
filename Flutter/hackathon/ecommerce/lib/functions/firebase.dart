import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/login/feild_errors.dart';
import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:ecommerce/screens/register/feild_errors.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<dynamic> addUser(
    {required BuildContext context,
    required setState,
    required String email,
    required String password,
    required RegisterFieldErrors errors}) async {
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
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }
}

Future<bool> logIn(
    {required setState,
    required String email,
    required String password,
    required LoginFieldErrors errors}) async {
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
  if (await isSignInWithGoogle()) {
    await GoogleSignIn().signOut();
  }
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
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
