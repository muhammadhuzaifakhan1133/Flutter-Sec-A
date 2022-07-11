import 'package:flutter/material.dart';

BottomAppBar bottomNavigationBar(
    {required onNewPressed, required onFolderPressed}) {
  return BottomAppBar(
    elevation: 0,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      InkWell(
        onTap: onNewPressed,
        child: Row(
          children: [
            Icon(Icons.add, color: Colors.blue),
            Text(
              "New list",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      IconButton(
          onPressed: onFolderPressed,
          icon: Icon(Icons.add_card_sharp, color: Colors.blue))
    ]),
  );
}
