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
                SizedBox(
                  height: 10,
                ),
                ListTile(
                    // dense: false,
                    contentPadding: EdgeInsets.all(3),
                    minLeadingWidth: 0,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Recharge Completed",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    subtitle: Text(
                      "Your last recharge on 9847229989 of 199 rs has been succesfully completed.",
                      style: TextStyle(color: Color(0xff9A9B9B)),
                    ),
                    trailing: IconButton(
                        iconSize: 45,
                        color: Color(0xff343645),
                        onPressed: () {},
                        icon: Icon(Icons.circle_notifications_rounded)))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
