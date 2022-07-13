import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/functions/is_right_provider.dart';
import 'package:todolist/functions/save_sign_in_as_google.dart';
import 'package:todolist/functions/save_user_as_active.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/push_with_internet_checking/push_with_intenet_checking.dart';
import 'package:todolist/widgets/loading_widget.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    await googleSignIn.signOut();
    Fluttertoast.cancel();
    if (!(await InternetConnectionChecker().hasConnection)) {
      Fluttertoast.showToast(msg: "No Internet Connection");
    }
    final googleUser = await googleSignIn.signIn();
    circleProgressDialog(context);
    if (googleUser == null) {
      Navigator.of(context, rootNavigator: true).pop();
      return;
    }
    _user = googleUser;
    if (!(await isRightProvider(
        context: context, email: _user!.email, loginWithgoogle: true))) {
      return;
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();

    await saveAsActiveUser(_user!.displayName!);
    await setSignInAsGoogleOrNot(true);
    await saveUserName(documentID: _user!.email, name: (_user?.displayName)!);
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => PushWithCheckingInternet(
                destination: Home(name: _user!.displayName))),
        (route) => false);
  }
}
