import 'package:flutter/material.dart';

List<Widget> tabNames() {
  return <Widget>[
    const Tab(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
    const Tab(
      child: Text(
        "Balance",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
    const Tab(
      child: Text(
        "Offers",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
    const Tab(
      child: Text(
        "Rewards",
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    )
  ];
}
