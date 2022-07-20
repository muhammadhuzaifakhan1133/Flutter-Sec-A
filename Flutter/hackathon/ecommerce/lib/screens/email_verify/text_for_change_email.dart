import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/register/register_screen.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Row textForChangeEmail(BuildContext context,
    {timer, resendtimer, canResendEmail}) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    const Text(
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
          // ignore: use_build_context_synchronously
          closeDialog(context);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        },
        child: const Text(
          "  change email",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        )),
  ]);
}
