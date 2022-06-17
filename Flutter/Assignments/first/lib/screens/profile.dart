import 'package:first/widgets/button_widget.dart';
import 'package:first/widgets/profile/profile_card.dart';
import 'package:first/widgets/profile/settings.dart';
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
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 8, left: 8),
          child: Column(
            children: [
              profileCard(),
              settingCard(titles: [
                "All Transactions",
                "Pending Transactions",
                "Refund State",
                "Raise an issue",
                "Help and Support"
              ], leftImages: [
                "assets/images/profile_transactions.png",
                "assets/images/profile_caution.png",
                "assets/images/profile_clock.png",
                "assets/images/profile_caution_without_cirlce.png",
                "assets/images/profile_heart.png"
              ]),
              settingCard(titles: [
                "About Us",
                "Terms and Conditions",
                "Feedback"
              ], leftImages: [
                "assets/images/profile_caution.png",
                "assets/images/profile_clock.png",
                "assets/images/profile_caution_without_cirlce.png"
              ])
            ],
          ),
        ),
      )),
    );
  }
}
