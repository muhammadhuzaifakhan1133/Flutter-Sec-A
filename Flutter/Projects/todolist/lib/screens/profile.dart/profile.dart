import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/is_sign_in_with_google.dart';
import 'package:todolist/functions/remove_active_user.dart';
import 'package:todolist/screens/profile.dart/avatar_with_cross.dart';
import 'package:todolist/screens/welcome/welcome.dart';
import 'package:todolist/widgets/loading_widget.dart';

class Profile extends StatefulWidget {
  Profile({required this.name, Key? key}) : super(key: key);
  String? name;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool? isDeviceConnected;
  logout() async {
    circleProgressDialog(context);
    if (!(await InternetConnectionChecker().hasConnection)) {
      Navigator.of(context, rootNavigator: true).pop();
      Fluttertoast.showToast(msg: "No Internet Connection");
      return;
    }
    if (await isSignInWithGoogle()) {
      await GoogleSignIn().disconnect();
    }
    FirebaseAuth.instance.signOut();
    await removeActiveUser();
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Welcome()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.1),
                  avatarWithCrossIcon(
                      context: context,
                      photoUrl: user.photoURL,
                      name: widget.name),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${widget.name}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Icon(Icons.keyboard_arrow_up)
                      ],
                    ),
                  ),
                  Text("${user.email}", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Divider(thickness: 2),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
