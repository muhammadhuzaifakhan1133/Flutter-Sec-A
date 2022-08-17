import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/firebase/user.dart';
import 'package:todolist/functions/is_right_provider.dart';
import 'package:todolist/functions/push_and_remove_until.dart';
import 'package:todolist/functions/save_user_as_active.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/widgets/loading_widget.dart';

Future signInWithGoogle(BuildContext context) async {
  Fluttertoast.cancel();
  if (!(await InternetConnectionChecker().hasConnection)) {
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }
  final googleUser = await GoogleSignIn().signIn();
  // ignore: use_build_context_synchronously
  circleProgressDialog(context);
  if (googleUser == null) {
    // ignore: use_build_context_synchronously
    closeDialog(context);
    return;
  }
  if (!(await isRightProvider(
      context: context, email: googleUser.email, loginWithgoogle: true))) {
    await GoogleSignIn().signOut();
    return;
  }
  try {
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return;
  }
  bool ifDocExist;
  try {
    ifDocExist = await checkIfDocExist(documentID: (googleUser.email));
  } catch (e) {
    // ignore: use_build_context_synchronously
    closeDialog(context);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return;
  }
  if (!(ifDocExist)) {
    await saveUserName(
        documentID: googleUser.email, name: (googleUser.displayName)!);
  }
  await saveAsActiveUser(googleUser.displayName!);
  // ignore: use_build_context_synchronously
  closeDialog(context);
  // ignore: use_build_context_synchronously
  pushAndRemoveUntil(context, Home(name: googleUser.displayName));
}
