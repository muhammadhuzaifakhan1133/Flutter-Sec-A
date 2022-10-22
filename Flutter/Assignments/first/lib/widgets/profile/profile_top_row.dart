import 'package:flutter/material.dart';

profileTopRow() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Hero(
          tag: "profile",
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/profile.jpg"),
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
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Image(image: AssetImage("assets/images/profile_badge.png")),
                  SizedBox(
                    width: 55,
                  ),
                  Image(
                    image: AssetImage("assets/images/receive_money_cross.png"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Level 4 Ace Member",
              style: TextStyle(color: Color(0xffB0BEC5), fontSize: 13),
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
                      image:
                          AssetImage("assets/images/profile_progress_bar.png"),
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
  );
}
