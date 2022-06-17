import 'package:first/widgets/profile/button_with_icon.dart';
import 'package:flutter/material.dart';

profileThirdRow() {
  return Padding(
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
  );
}
