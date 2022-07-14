import 'package:flutter/material.dart';

CircleAvatar profileAvatar({String? photoUrl, String? name, double? radius}) {
  return CircleAvatar(
    radius: radius,
    backgroundImage: (photoUrl != null) ? NetworkImage(photoUrl) : null,
    backgroundColor: Colors.blue,
    child: (photoUrl == null) ? Text(name![0]) : null,
  );
}
