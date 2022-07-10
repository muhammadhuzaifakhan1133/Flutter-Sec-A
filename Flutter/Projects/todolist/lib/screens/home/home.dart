import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todolist/functions/is_sign_in_with_google.dart';
import 'package:todolist/functions/remove_active_user.dart';
import 'package:todolist/screens/welcome/welcome.dart';
import 'package:todolist/widgets/loading_widget.dart';

class Home extends StatefulWidget {
  Home({required this.name, Key? key}) : super(key: key);
  String? name;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  logout() async {
    circleProgressDialog(context);
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
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: user?.photoURL != null
                  ? Image(image: NetworkImage("${user?.photoURL}"))
                  : Text(widget.name![0]),
              backgroundColor: user?.photoURL != null ? Colors.blue : null,
            ),
            Text("${widget.name}"),
            Text("${user?.email}"),
            ElevatedButton(
                onPressed: () {
                  logout();
                },
                child: Text("Log out"))
          ],
        ),
      ),
    );
  }
}
