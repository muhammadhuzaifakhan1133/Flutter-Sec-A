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
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xff1F222A),
                elevation: 10,
                child: Container(
                  width: double.infinity,
                  height: 190,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 3),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.jpg"),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Huzaifa",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Image(
                                          image: AssetImage(
                                              "assets/images/profile_badge.png"))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Level 4 Ace Member",
                                  style: TextStyle(
                                      color: Color(0xffB0BEC5), fontSize: 13),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
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
