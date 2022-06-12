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
        "Balance",
        style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
      ),
    ),
    Tab(
      child: Text(
        "Offers",
        style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
      ),
    ),
    Tab(
      child: Text(
        "Rewards",
        style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
      ),
    )
  ];
}
