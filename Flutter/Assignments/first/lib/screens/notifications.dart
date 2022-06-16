import 'package:first/widgets/notification/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 30),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xff1F222A),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 7),
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notifications",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(right: 9.0),
                      child: Image(
                        image:
                            AssetImage("assets/images/receive_money_cross.png"),
                      ),
                    ),
                  ],
                ),
                notificationTile(
                    title: "Recharge Completed",
                    subTitle:
                        "Your last recharge on 9847229989 of 199 rs has been succesfully completed.",
                    time: "May 20  - 12:32 Pm"),
                notificationTile(
                    title: "Money Recived",
                    subTitle:
                        "Your account ***21445 has been recieved an amount of Rs 1000 using upi transaction.",
                    time: "May 20  - 12:45 Pm"),
                notificationTile(
                    title: "Offer Unlocked",
                    subTitle:
                        "You have an unlockd offer avilable go to offer section or tap to view the offer.",
                    time: "May 20  - 2:45 Pm"),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Notifications",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.only(right: 9),
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
