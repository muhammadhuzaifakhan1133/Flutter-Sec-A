import 'package:first/widgets/profile/button_with_icon.dart';
import 'package:first/widgets/profile/profile_second_row.dart';
import 'package:first/widgets/profile/profile_third_row.dart';
import 'package:first/widgets/profile/profile_top_row.dart';
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
            children: [profileTopRow(), profileSecondRow(), profileThirdRow()],
          ),
        ),
      ));
}
