import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/profile.dart/avatar_with_cross.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  Profile({required this.name, Key? key}) : super(key: key);
  String? name;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                        const Icon(Icons.keyboard_arrow_up)
                      ],
                    ),
                  ),
                  Text("${user.email}", style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Divider(thickness: 2),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await logout(context: context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text("Delete Account",
                  style: TextStyle(color: Colors.red)),
              onTap: () async {
                await deleteAccount(
                    context: context, documentID: (user.email)!);
              },
            )
          ],
        ),
      ),
    );
  }
}
