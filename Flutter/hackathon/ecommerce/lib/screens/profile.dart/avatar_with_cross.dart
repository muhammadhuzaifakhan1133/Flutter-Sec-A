import 'package:ecommerce/screens/profile.dart/profile_avatar.dart';
import 'package:flutter/material.dart';

Row avatarWithCrossIcon(
    {required BuildContext context, String? photoUrl, String? name}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Hero(
            tag: "profileAvatar",
            child: profileAvatar(photoUrl: photoUrl, name: name, radius: 35)),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: IconButton(
          icon: const Icon(Icons.close, color: Colors.blue, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
    ],
  );
}
