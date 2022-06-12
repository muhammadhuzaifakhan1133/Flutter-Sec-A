import 'package:first/screens/balance.dart';
import 'package:first/screens/home.dart';
import 'package:first/screens/offers.dart';
import 'package:first/screens/rewards.dart';
import 'package:flutter/material.dart';

List<Widget> tabContent() {
  return <Widget>[Home(), Balance(), Offers(), Rewards()];
}
