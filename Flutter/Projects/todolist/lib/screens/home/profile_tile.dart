import 'package:flutter/material.dart';
import 'package:todolist/screens/home/profile_avatar.dart';
import 'package:todolist/screens/home/profile_title.dart';

ListTile profileTile(
    {String? photoUrl, String? email, String? name, bool? isDeviceConnected}) {
  return ListTile(
    leading: Hero(
        tag: "profileAvatar",
        child: profileAvatar(
            photoUrl: photoUrl,
            name: name,
            isDeviceConnected: isDeviceConnected)),
    title: profileTitle(name),
    subtitle: Text("$email"),
    trailing: const Icon(
      Icons.search,
      size: 40,
      color: Colors.blue,
    ),
  );
}
