import 'package:flutter/material.dart';

List<Widget> tabNames() {
  return <Widget>[
    Tab(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
      ),
    ),
    Tab(
      child: Text(
        "Contact",
        style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
      ),
    ),
  ];
}
