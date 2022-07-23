import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/functions/is_right_provider.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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
  await setSignInAsGoogleOrNot(true);
  // ignore: use_build_context_synchronously
  closeDialog(context);
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => BottomBarController()));
}
