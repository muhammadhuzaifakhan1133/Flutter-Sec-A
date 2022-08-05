import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';

class UserInfo extends StatelessWidget {
  UserInfo({required this.user, Key? key}) : super(key: key);
  User user;
  double spaceBetween = 10;
  TextStyle keyStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  TextStyle valueStyle = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Id                : ", style: keyStyle),
                  Text("${user.id}", style: valueStyle),
                ],
              ),
              SizedBox(height: spaceBetween),
              Row(
                children: [
                  Text("Name         : ", style: keyStyle),
                  Text("${user.name}", style: valueStyle),
                ],
              ),
              SizedBox(height: spaceBetween),
              Row(
                children: [
                  Text("Username : ", style: keyStyle),
                  Text("${user.username}", style: valueStyle),
                ],
              ),
              SizedBox(height: spaceBetween),
              Row(
                children: [
                  Text("Address     : ", style: keyStyle),
                  Flexible(
                    child: Text(
                        "${user.address?.suite} ${user.address?.street} ${user.address?.city} ${user.address?.zipcode} [${user.address?.geo?.lat}, ${user.address?.geo?.lng}]",
                        style: valueStyle),
                  ),
                ],
              ),
              SizedBox(height: spaceBetween),
              Row(
                children: [
                  Text("Phone         : ", style: keyStyle),
                  Text("${user.phone}", style: valueStyle),
                ],
              ),
              SizedBox(height: spaceBetween),
              Row(
                children: [
                  Text("Website      : ", style: keyStyle),
                  Text("${user.website}", style: valueStyle),
                ],
              ),
              SizedBox(height: spaceBetween),
              Row(
                children: [
                  Text("Company    : ", style: keyStyle),
                  Flexible(
                    child: Text(
                        "${user.company?.name} | ${user.company?.catchPhrase} | ${user.company?.bs}",
                        style: valueStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
