import 'package:first/widgets/button_widget.dart';
import 'package:first/widgets/profile/profile_card.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 8, left: 8),
        child: Column(
          children: [
            profileCard(),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xff1F222A),
                elevation: 10,
                child: Container(width: double.infinity, height: 100)),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xff1F222A),
                elevation: 10,
                child: Container(width: double.infinity, height: 100))
          ],
        ),
      )),
    );
  }
}
