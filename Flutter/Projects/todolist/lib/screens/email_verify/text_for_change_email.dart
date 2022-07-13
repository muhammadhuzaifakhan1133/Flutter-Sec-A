import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/functions/remove_active_user.dart';
import 'package:todolist/screens/signup/signup.dart';
import 'package:todolist/widgets/loading_widget.dart';

Row textForChangeEmail(BuildContext context,
    {timer, resendtimer, canResendEmail}) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(
      "Not you?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    InkWell(
        onTap: () async {
          circleProgressDialog(context);
          timer.cancel();
          User? user = FirebaseAuth.instance.currentUser;

          await user?.delete();
          await FirebaseAuth.instance.signOut();
          removeActiveUser();
          if (!canResendEmail) {
            resendtimer?.cancel();
          }
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
              (route) => false);
        },
        child: const Text(
          "  change email",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        )),
  ]);
}
