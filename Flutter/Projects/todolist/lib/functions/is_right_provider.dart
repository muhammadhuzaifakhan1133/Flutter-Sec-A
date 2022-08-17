import 'package:flutter/material.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/firebase/user.dart';

isRightProvider(
    {required BuildContext context,
    required String email,
    required bool loginWithgoogle}) async {
  List<String> provider = await getEmailProviders(email, context);
  String oppositeProvider = loginWithgoogle ? "password" : "google.com";
  if ((provider.isNotEmpty) && (provider[0] == oppositeProvider)) {
    // ignore: use_build_context_synchronously
    closeDialog(context);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Provider Exist"),
              content: Text(loginWithgoogle
                  ? "Email is already sign up with email and password. Try Login with email and password"
                  : "Email is already sign up with google. Try Login with google"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("CANCEL"))
              ],
            ));
    return false;
  }
  return true;
}
