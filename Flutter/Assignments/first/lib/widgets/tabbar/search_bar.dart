import 'package:first/constants/user_constants.dart';
import 'package:flutter/material.dart';

searchBarWidget() {
  var constants = UserConstants();
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Theme(
      data: ThemeData(primaryColor: Colors.black),
      child: TextField(
        style: TextStyle(color: constants.txt_color),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              // borderSide: BorderSide(color: Colors.black)
            ),
            filled: true,
            hintStyle: TextStyle(color: constants.txt_color),
            hintText: "Search Users,ID’s etc",
            suffixIcon: Icon(
              Icons.search,
              color: Color(0xff97A3AB),
            ),
            fillColor: Color(0xff343645)),
      ),
    ),
  );
}
