import 'package:ecommerce/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

bagScreenAppBar({required String username, required String? userPhotoUrl}) {
  return AppBar(
    title: Text(
      "Cart",
      style: TextStyle(
          color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      Icon(
        Icons.search,
        size: 30,
        color: Colors.black,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: profileAvatar(userName: username, userPhotoUrl: userPhotoUrl),
      )
    ],
  );
}
