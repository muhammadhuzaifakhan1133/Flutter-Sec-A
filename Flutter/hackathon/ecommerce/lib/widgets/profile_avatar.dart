import 'package:flutter/material.dart';

CircleAvatar profileAvatar({required String userName, String? userPhotoUrl}) {
  return CircleAvatar(
    radius: 20,
    backgroundImage:
        (userPhotoUrl != null) ? NetworkImage((userPhotoUrl)) : null,
    backgroundColor: Colors.blue,
    child: userPhotoUrl == null ? Text(userName[0]) : null,
  );
}
