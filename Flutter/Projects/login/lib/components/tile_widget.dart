// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:login/components/gap_box.dart';

getTile(
    {String image = "assets/images/LOGO.jpg",
    radius = 35.0,
    String title = "",
    String subtitle = "",
    String time = ""}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: radius,
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Column(
            children: [
              Text(time),
              GapBox(height: 10.0),
              Icon(
                Icons.done_all,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
      Divider()
    ],
  );
}
