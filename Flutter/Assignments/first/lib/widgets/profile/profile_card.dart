import 'package:first/widgets/profile/button_with_icon.dart';
import 'package:flutter/material.dart';

profileCard() {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Color(0xff1F222A),
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: 220,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, bottom: 3, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Hero(
                      tag: "profile",
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                                      "assets/images/profile_badge.png")),
                              SizedBox(
                                width: 85,
                              ),
                              Image(
                                image: AssetImage(
                                    "assets/images/receive_money_cross.png"),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Level 4 Ace Member",
                          style:
                              TextStyle(color: Color(0xffB0BEC5), fontSize: 13),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 13),
                              child: Text(
                                "85%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffB0BEC5),
                                    fontSize: 12),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/images/profile_progress_bar.png"),
                                ),
                                Text(
                                  "Lv 5",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffB0BEC5),
                                      fontSize: 12),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "1,208",
                            style: TextStyle(
                                color: Color(0xff4D5DFA), fontSize: 22),
                          ),
                          Text(
                            "Transaction",
                            style: TextStyle(
                                color: Color(0xff939FA4), fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(width: 7),
                      VerticalDivider(
                        thickness: 1,
                        color: Color(0xffF8F8F8),
                      ),
                      SizedBox(width: 7),
                      Column(
                        children: [
                          Text(
                            "726",
                            style: TextStyle(
                                color: Color(0xff4D5DFA), fontSize: 22),
                          ),
                          Text(
                            "Points",
                            style: TextStyle(
                                color: Color(0xff939FA4), fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(width: 7),
                      VerticalDivider(
                        thickness: 1,
                        color: Color(0xffF8F8F8),
                      ),
                      SizedBox(width: 7),
                      Column(
                        children: [
                          Text(
                            "8",
                            style: TextStyle(
                                color: Color(0xff4D5DFA), fontSize: 22),
                          ),
                          Text(
                            "Rank",
                            style: TextStyle(
                                color: Color(0xff939FA4), fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      buttonWithSuffixIcon(
                          text: "Explore",
                          iconPath: "assets/images/profile_explore_icon.png")
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonWithSuffixIcon(
                        width: 110,
                        text: "Edit Profile",
                        iconPath: "assets/images/profile_edit_icon.png"),
                    buttonWithSuffixIcon(
                        width: 95,
                        text: "Settings",
                        iconPath: "assets/images/profile_setting_icon.png"),
                    buttonWithSuffixIcon(
                        gapBetweenTextAndIcon: 16,
                        width: 80,
                        text: "Share",
                        iconPath: "assets/images/profile_share.png")
                  ],
                ),
              )
            ],
          ),
        ),
      ));
}
