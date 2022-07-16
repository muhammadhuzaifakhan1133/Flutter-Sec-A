import 'package:flutter/material.dart';

CircleAvatar profileAvatar(
    {String? photoUrl, String? name, double? radius, bool? isDeviceConnected}) {
  return CircleAvatar(
    radius: radius,
    backgroundImage: ((photoUrl != null) && (isDeviceConnected == true))
        ? NetworkImage(photoUrl)
        : null,
    backgroundColor: Colors.blue,
    child: ((photoUrl == null) ||
            (isDeviceConnected == null) ||
            (isDeviceConnected == false))
        ? Text(name![0])
        : null,
  );
}
