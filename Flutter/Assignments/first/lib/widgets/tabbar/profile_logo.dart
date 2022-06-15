import 'package:first/screens/profile.dart';
import 'package:first/widgets/button_widget.dart';
import 'package:flutter/material.dart';

profileLogo(context) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 4),
    child: InkWell(
      onTap: () {
        navigateTo(context, Profile());
      },
      child: Container(
        // margin: EdgeInsets.only(top: 15),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpg"),
          radius: 25,
        ),
      ),
    ),
  );
}
