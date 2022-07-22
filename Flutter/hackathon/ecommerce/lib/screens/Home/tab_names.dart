import 'package:flutter/material.dart';

List<Widget> tabNames() {
  return <Widget>[
    const Tab(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
      ),
    ),
    const Tab(
      child: Text(
        "Contact",
        style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
      ),
    ),
  ];
}
