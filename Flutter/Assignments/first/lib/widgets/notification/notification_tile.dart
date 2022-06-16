import 'package:flutter/material.dart';

notificationTile({String? title, String? subTitle, String? time}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            title!,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        subtitle: Text(
          subTitle!,
          style: TextStyle(color: Color(0xff9A9B9B)),
        ),
        trailing: IconButton(
            iconSize: 45,
            color: Color(0xff343645),
            onPressed: () {},
            icon: Icon(Icons.circle_notifications_rounded))),
    Padding(
      padding: const EdgeInsets.only(top: 6, left: 3, bottom: 8),
      child: Text(
        time!,
        style: TextStyle(color: Color(0xff9A9B9B), fontSize: 12),
      ),
    )
  ]);
}
