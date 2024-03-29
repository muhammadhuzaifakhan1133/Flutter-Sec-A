import 'package:flutter/material.dart';
import 'package:todolist/screens/home/profile_avatar.dart';
import 'package:todolist/screens/home/profile_title.dart';
import 'package:todolist/screens/search_task/search_task.dart';

ListTile profileTile(
    {required BuildContext context,
    String? photoUrl,
    String? email,
    String? name}) {
  return ListTile(
    leading: Hero(
        tag: "profileAvatar",
        child: profileAvatar(photoUrl: photoUrl, name: name)),
    title: profileTitle(name),
    subtitle: Text("$email"),
    trailing: IconButton(
      icon: const Icon(Icons.search, size: 40, color: Colors.blue),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchTask()));
      },
    ),
  );
}
